import 'package:flutter/material.dart';
import 'package:moka_store/core/utils/constants_manager.dart';
import 'package:moka_store/moka/presentation/controller/moka_bloc.dart';

import '../../../../config/locale/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(AppLocalizations.of(context)!.translate('account')!,
                      style: theme.textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: MokaBloc.get(context).state.isDark
                            ? Colors.white
                            : Colors.black,
                      )),
                  const SizedBox(height: 16),
                  Container(
                    height: 80,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: MokaBloc.get(context).state.isDark
                          ? Colors.grey.shade700
                          : Colors.grey.shade200,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: MokaBloc.get(context).state.isDark
                                ? Colors.grey.shade500
                                : Colors.grey.shade300,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.person,
                              size: 32,
                              color: MokaBloc.get(context).state.isDark
                                  ? Colors.grey.shade300
                                  : Colors.grey.shade500, //500 when light
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                            "${AppLocalizations.of(context)!.translate('login')!} / ${AppLocalizations.of(context)!.translate('register')!}",
                            style: theme.textTheme.subtitle1?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.blue,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(AppLocalizations.of(context)!.translate('settings')!,
                      style: theme.textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: MokaBloc.get(context).state.isDark
                            ? Colors.white
                            : Colors.black,
                      )),
                  const SizedBox(height: 16),
                  _buildListTile(
                    context,
                    AppLocalizations.of(context)!.translate('appearance')!,
                    Icons.dark_mode,
                    MokaBloc.get(context).state.isDark
                        ? AppLocalizations.of(context)!.translate('dark_mode')!
                        : AppLocalizations.of(context)!
                            .translate('light_mode')!,
                    Colors.purple,
                    theme,
                    onTab: () => _showAppearanceModal(theme, context),
                  ),
                  // }),
                  const SizedBox(height: 8),
                  _buildListTile(
                      context,
                      AppLocalizations.of(context)!.translate('language')!,
                      Icons.language,
                      AppLocalizations.of(context)!.isEnLocale
                          ? AppLocalizations.of(context)!.translate('english')!
                          : AppLocalizations.of(context)!.translate('arabic')!,
                      Colors.orange,
                      theme, onTab: () {
                    _showAppearanceModalLang(theme, context);
                  }),
                  const SizedBox(height: 8),
                  _buildListTile(
                      context,
                      AppLocalizations.of(context)!.translate('notifications')!,
                      Icons.notifications_outlined,
                      '',
                      Colors.blue,
                      theme,
                      onTab: () {}),
                  const SizedBox(height: 8),
                  _buildListTile(
                      context,
                      AppLocalizations.of(context)!.translate('help')!,
                      Icons.help,
                      '',
                      Colors.green,
                      theme,
                      onTab: () {}),
                  const SizedBox(height: 8),
                  _buildListTile(
                      context,
                      AppLocalizations.of(context)!.translate('logout')!,
                      Icons.exit_to_app,
                      '',
                      Colors.red,
                      theme,
                      onTab: () {}),
                ],
              ),
              Text(
                  "${AppLocalizations.of(context)!.translate('version')!} 1.0.0",
                  style: theme.textTheme.bodyText2
                      ?.copyWith(color: Colors.grey.shade500)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(
      context, String title, IconData icon, String trailing, Color color, theme,
      {onTab}) {
    return ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: Container(
          width: 46,
          height: 46,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: color.withAlpha(30)),
          child: Center(
            child: Icon(
              icon,
              color: color,
            ),
          ),
        ),
        title: Text(
          title,
          style: theme.textTheme.subtitle1?.copyWith(
            color: MokaBloc.get(context).state.isDark
                ? Colors.white
                : Colors.black,
          ),
        ),
        trailing: SizedBox(
          width: 130,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(trailing,
                  style: theme.textTheme.bodyText1
                      ?.copyWith(color: Colors.grey.shade600)),
              const SizedBox(width: 12),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: MokaBloc.get(context).state.isDark
                    ? Colors.white
                    : Colors.black,
              ),
            ],
          ),
        ),
        onTap: onTab);
  }

  _showAppearanceModal(ThemeData theme, context) {
    bool current = MokaBloc.get(context).state.isDark;
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(26))),
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(16),
            height: 300,
            decoration: BoxDecoration(
                color: MokaBloc.get(context).state.isDark
                    ? Colors.grey.shade900
                    : Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                )),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.translate('select_theme')!,
                  style: theme.textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: MokaBloc.get(context).state.isDark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                const SizedBox(height: 32),
                ListTile(
                  leading: const Icon(
                    Icons.brightness_5,
                    color: Colors.blue,
                  ),
                  title: Text(
                      AppLocalizations.of(context)!.translate('light_mode')!,
                      style: theme.textTheme.bodyText1),
                  onTap: () {
                    MokaBloc.get(context).add(changeModeEvent(false));

                    Navigator.pop(context);
                  },
                  trailing: Icon(
                    Icons.check,
                    color: current == false ? Colors.green : Colors.transparent,
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: const Icon(
                    Icons.brightness_2,
                    color: Colors.orange,
                  ),
                  title: Text(
                      AppLocalizations.of(context)!.translate('dark_mode')!,
                      style: theme.textTheme.bodyText1),
                  onTap: () {
                    MokaBloc.get(context).add(changeModeEvent(true));
                    Navigator.pop(context);
                  },
                  trailing: Icon(
                    Icons.check,
                    color: current == true ? Colors.green : Colors.transparent,
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: const Icon(
                    Icons.brightness_6,
                    color: Colors.blueGrey,
                  ),
                  title: Text(
                      AppLocalizations.of(context)!.translate('system_mode')!,
                      style: theme.textTheme.bodyText1),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  _showAppearanceModalLang(ThemeData theme, context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(26))),
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(16),
            height: 240,
            decoration: BoxDecoration(
                color: MokaBloc.get(context).state.isDark
                    ? Colors.grey.shade900
                    : Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                )),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.translate('select_language')!,
                  style: theme.textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: MokaBloc.get(context).state.isDark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                const SizedBox(height: 32),
                ListTile(
                  leading: const Icon(
                    Icons.translate,
                    color: Colors.blue,
                  ),
                  title: Text(
                      AppLocalizations.of(context)!.translate('english')!,
                      style: theme.textTheme.bodyText1),
                  onTap: () {
                    if (!AppLocalizations.of(context)!.isEnLocale) {
                      MokaBloc.get(context)
                          .add(changeLangEvent(AppConstants.englishCode));
                    }
                    Navigator.pop(context);
                  },
                  trailing: Icon(
                    Icons.check,
                    color: AppLocalizations.of(context)!.isEnLocale
                        ? Colors.green
                        : Colors.transparent,
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: const Icon(
                    Icons.g_translate,
                    color: Colors.orange,
                  ),
                  title: Text(
                      AppLocalizations.of(context)!.translate('arabic')!,
                      style: theme.textTheme.bodyText1),
                  onTap: () {
                    if (AppLocalizations.of(context)!.isEnLocale) {
                      MokaBloc.get(context)
                          .add(changeLangEvent(AppConstants.arabicCode));
                    }
                    Navigator.pop(context);
                  },
                  trailing: Icon(
                    Icons.check,
                    color: !AppLocalizations.of(context)!.isEnLocale
                        ? Colors.green
                        : Colors.transparent,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
