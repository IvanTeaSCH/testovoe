import 'package:flutter/material.dart';
import 'package:testovoe/feature/domain/entities/user_entity.dart';
import 'package:testovoe/l10n/app_localizations.dart';

class UserDetailPage extends StatelessWidget {
  final UserEntity user;

  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: ListView(
        padding: EdgeInsets.all(16).copyWith(bottom: 40),
        children: [
          _buildSectionTitle(appLocale.basicInformation),
          _buildInfoRow(appLocale.name, user.name),
          _buildInfoRow(appLocale.userName, user.username),
          _buildInfoRow(appLocale.email, user.email),
          _buildInfoRow(appLocale.phone, user.phone),
          _buildInfoRow(appLocale.website, user.website),

          const SizedBox(height: 20),
          _buildSectionTitle(appLocale.address),
          _buildInfoRow(appLocale.street, user.address?.street),
          _buildInfoRow(appLocale.suite, user.address?.suite),
          _buildInfoRow(appLocale.city, user.address?.city),
          _buildInfoRow(appLocale.zipcode, user.address?.zipcode),

          const SizedBox(height: 20),
          _buildSectionTitle(appLocale.company),
          _buildInfoRow(appLocale.nameCompany, user.company?.name),
          _buildInfoRow(appLocale.catchPhrase, user.company?.catchPhrase),
          _buildInfoRow(appLocale.bs, user.company?.bs),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.w600)),
          Expanded(child: Text(value ?? '-')),
        ],
      ),
    );
  }
}
