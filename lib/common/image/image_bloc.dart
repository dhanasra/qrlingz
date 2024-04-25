import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../network/firebase_client.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageInitial()) {
    on<PickAndUploadImage>(_onPickAndUploadImage);
  }

  final FirebaseClient _client = FirebaseClient();

  _onPickAndUploadImage(PickAndUploadImage event, Emitter emit)async{
    emit(ImagePicking());
    try{

      XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(file==null){
        emit(Error());
        return;
      }

      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: file.path,
        cropStyle: CropStyle.rectangle,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9,
          CropAspectRatioPreset.original,
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarColor: Colors.white,
              toolbarWidgetColor: Colors.black,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Crop Image',
          ),
        ],
      );

      if(croppedFile==null){
        emit(Error());
        return;
      }

      TaskSnapshot task = await _client.storageReference.putFile(File(croppedFile.path));
      var url = await task.ref.getDownloadURL();
      emit(ImageFetched(url: url));
    
    }catch(e){
      print(e);
      emit(ImageError());
    }
  }
}
