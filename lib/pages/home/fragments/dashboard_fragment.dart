import 'package:flutter/material.dart';
import 'package:qrlingz_app/constants/color_const.dart';
import 'package:qrlingz_app/constants/data_const.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/pages/home/home_viewmodel.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/widgets/styled_wrapper.dart';

class DashboardFrament extends StatelessWidget {
  final HomeViewModel vm;
  const DashboardFrament({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {

    const items = DataConst.qrItems;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        ...items.keys.map(
          (e){

            var enabled = vm.checkLoginStatus(e);
            List values = items[e]!; 

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                e.ts(context),
                Visibility(
                  visible: !enabled,
                  child: '* Login to access this feature'.bs(context, color: ColorConst.primary)),
                GridView.builder(
                  itemCount: values.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16
                  ), 
                  padding: const EdgeInsets.only(top: 16, bottom: 20),
                  itemBuilder: (_, idx){
                    var item = values[idx];

                    return InkWell(
                      onTap: (){
                        if(enabled){
                          context.goto(Routes.create, args: item['text']);
                        }else{
                          context.goto(Routes.login);
                        }
                      },
                      child: StyledWrapper(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if(item['icon']!=null)
                              Icon(item['icon'], size: 26,)
                            else
                              Image.asset(item['image'], width: 40),
                            8.h(),
                            '${item['text']}'.bs(context, color: Colors.grey)
                          ],
                        ),
                      ),
                    );
                  }
                ),

                16.h(),
              ],
            );
          }  
        ),

      ],
    );
  }
}