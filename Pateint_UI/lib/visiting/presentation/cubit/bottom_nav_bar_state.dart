part of 'bottom_nav_bar_cubit.dart';

@immutable
abstract class BottomNavBarState extends Equatable{}

class BottomNavBarInitial extends BottomNavBarState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectedNewPage extends BottomNavBarState{
  int val;

  SelectedNewPage(this.val);

  @override
  // TODO: implement props
  List<Object?> get props => [val];
}


class ChangeIconColor extends BottomNavBarState{
   Color color;

   ChangeIconColor(this.color);

  @override
  // TODO: implement props
  List<Object?> get props => [color];

}
class BottomNavBarSuccess extends BottomNavBarState{

  final bool updateFlag;

  BottomNavBarSuccess({this.updateFlag=false});

  @override
  List<Object?> get props => [updateFlag];

  BottomNavBarSuccess copyWith({bool? update}){
    return BottomNavBarSuccess(
        updateFlag: update ?? updateFlag
    );
  }

}