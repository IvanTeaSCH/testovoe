import 'package:flutter/material.dart';
import 'package:testovoe/feature/domain/entities/user_entity.dart';
import 'package:testovoe/feature/presentation/pages/user_detail_screen.dart';
import 'package:testovoe/l10n/app_localizations.dart';
import 'package:testovoe/resources/icons_constants.dart';
import 'package:testovoe/resources/ui_themes.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    super.key,
    required this.user,
    required this.onFavorite,
  });

  final UserEntity user;
  final Function(UserEntity person) onFavorite;

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final appLocale = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserDetailPage(user: user)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: theme.mainCard,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "${appLocale.name}: ",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: theme.textGrey,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: user.name,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: theme.textPrimary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 24,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => onFavorite(user),
                          icon: Icon(
                            AppIcons.star,
                            color: user.favorite ? theme.star : theme.textGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${appLocale.userName}: ",
                          style: TextStyle(
                            fontSize: 20,
                            color: theme.textGrey,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: user.username,
                          style: TextStyle(
                            fontSize: 20,
                            color: theme.textPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Divider(),
                  SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${appLocale.phone}: ",
                          style: TextStyle(
                            fontSize: 16,
                            color: theme.textGrey,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: user.phone,
                          style: TextStyle(
                            fontSize: 16,
                            color: theme.textPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
