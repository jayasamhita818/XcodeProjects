import Photos
import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
                parent.onImagePicked()
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    var onImagePicked: () -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}





class PhotoLibraryViewModel: ObservableObject {
    @Published var images: [UIImage] = []
    @Published var authorizationStatus: PHAuthorizationStatus = .notDetermined

    init() {
        checkAuthorization()
    }

    func checkAuthorization() {
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
            DispatchQueue.main.async {
                self.authorizationStatus = status
                if status == .authorized || status == .limited {
                    self.fetchPhotos()
                }
            }
        }
    }

    func fetchPhotos() {
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)

        let imageManager = PHCachingImageManager()
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = false
        requestOptions.deliveryMode = .opportunistic

        fetchResult.enumerateObjects { (asset, _, _) in
            imageManager.requestImage(for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFill, options: requestOptions) { (image, _) in
                if let image = image {
                    DispatchQueue.main.async {
                        self.images.append(image)
                    }
                }
            }
        }
    }
}




struct CustomGalleryPicker: View {
    @Binding var isActive: Bool
    @Binding var selectedImage: UIImage?
    @StateObject private var viewModel = PhotoLibraryViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
            
            ZStack{
                Color.black
                
                VStack(alignment: .center){
                    
                    HStack(alignment: .center){
                        Spacer()
                        Image("fitzu_font")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 35)
                            .padding(.bottom)
                            .padding(.top)
                        Spacer()
                       
                    }
                    
                    VStack{
                        HStack(alignment: .center){
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }){
                                Image("back")
                                    .resizable()
                                    .frame(width: 20,height: 20)
                                
                            }
                            .padding(.leading)
                            Spacer()
                            Text("Choose Pictures")
                                .font(.custom("Poppins-Bold", size: 20))
                            Spacer()
                            Button(action: {}){
                                Image("back")
                                    .resizable()
                                    .frame(width: 20,height: 20)
                                
                            }.hidden()
                        }
                        .padding(.vertical)
                        .background(.navigationBar)
                
                        
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                                ForEach(viewModel.images, id: \.self) { image in
                                    Image(uiImage: image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .clipped()
                                        .onTapGesture {
                                            self.selectedImage = image
                                            self.isActive = false
                                        }
                                }
                            }
                            
                        }
                    }
                    .background(Color.white)
                }
            }
            
                
        .onAppear {
            viewModel.fetchPhotos()
        }
        
    }
}



struct CustomPicsPicker: View {
    @Binding var isActive: Bool
    @State var title: String
    @State private var showImagePicker = false
    @State private var showCustomGalleryPicker = false
    @Binding  var selectedImage: UIImage?

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.opacity(0.5)
                .onTapGesture {
                    isActive = false
                }

            VStack(spacing: 0) {
                Text(title)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .background(Color.yellow)
                    .padding(.bottom, 20)

                HStack {
                    Spacer()
                    VStack {
                        Image("cameraColor")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .onTapGesture {
                                showImagePicker = true
                            }
                        Text("Take Photo")
                    }
                    Spacer()
                    Color.gray
                        .frame(width: 2, height: 90)
                    Spacer()
                    VStack {
                        Image("picture")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .onTapGesture {
                                showCustomGalleryPicker = true
                            }
                        Text("Gallery")
                    }
                    Spacer()
                }
                .foregroundColor(.gray)
            }
            .background(Color.white)
            .frame(width: UIScreen.main.bounds.width)
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: $selectedImage, onImagePicked: {
                isActive = false
            })
        }
        .fullScreenCover(isPresented: $showCustomGalleryPicker) {
            CustomGalleryPicker(isActive: $isActive, selectedImage: $selectedImage)
        }
    }
}
