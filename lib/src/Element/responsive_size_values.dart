import 'package:flutter_screenutil/flutter_screenutil.dart';

setSp(double? value){
  return value != null ? ScreenUtil().setSp(value) : null;
}

setHeight(double? height){
  return height != null ? ScreenUtil().setHeight(height) : null;
}
setWidth(double? width){
  return width != null ? ScreenUtil().setWidth(width) : null;
}