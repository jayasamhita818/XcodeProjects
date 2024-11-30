//
//  MultipleImgPicker.swift
//  FitzuApp
//
//  Created by rounak suri on 13/06/24.
//
import SwiftUI
import Foundation

struct MultipleImgPicker: UIViewControllerRepresentable {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: MultipleImgPicker

        init(parent: MultipleImgPicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let images = info[.originalImage] as? [UIImage] {
                parent.selectedImages = images
                parent.onImagesPicked()
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    @Binding var selectedImages: [UIImage]
    @Environment(\.presentationMode) var presentationMode
    var onImagesPicked: () -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary // Set this to .camera if needed
        picker.allowsEditing = false
        picker.mediaTypes = ["public.image"]
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

struct CustomGalleryImgPicker: View {
    @Binding var isActive: Bool
    @Binding var selectedImages: [UIImage]
    @StateObject private var viewModel = PhotoLibraryViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ZStack {
            Color.black

            VStack(alignment: .center) {

                HStack(alignment: .center) {
                    Spacer()
                    Image("fitzu_font")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                        .padding(.bottom)
                        .padding(.top)
                    Spacer()
                }

                VStack {
                    HStack(alignment: .center) {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image("back")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                        .padding(.leading)
                        Spacer()
                        Text("Gallery")
                            .font(.custom("Poppins-Bold", size: 20))
                        Spacer()
                        Button(action: {
                            self.isActive = false
                        }) {
                            Text("Done")
                                .font(.custom("Poppins-Bold", size: 18))
                                .foregroundColor(.black)
                        }
                        .padding(.trailing)
                    }
                    .padding(.vertical)
                    .background(.navigationBar)

                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                            ForEach(viewModel.images, id: \.self) { image in
                                ZStack(alignment: .topTrailing) {
                                    Image(uiImage: image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .clipped()
                                        .onTapGesture {
                                            if let index = self.selectedImages.firstIndex(of: image) {
                                                self.selectedImages.remove(at: index)
                                            } else {
                                                self.selectedImages.append(image)
                                            }
                                        }
                                    
                                    if self.selectedImages.contains(image) {
                                        Image("blue_checked")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .padding(5)
                                    }
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


struct CustomMultiplePicsPicker: View {
    @Binding var isActive: Bool
    @State var title: String
    @State private var showImagePicker = false
    @State private var showCustomGalleryPicker = false
    @Binding var selectedImages: [UIImage]

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
            MultipleImgPicker(selectedImages: $selectedImages, onImagesPicked: {
                isActive = false
            })
        }
        .fullScreenCover(isPresented: $showCustomGalleryPicker) {
            CustomGalleryImgPicker(isActive: $isActive, selectedImages: $selectedImages)
        }
    }
}
