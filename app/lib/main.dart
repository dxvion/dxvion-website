import 'package:flutter/material.dart';

const navy = Color(0xFF0B1F33);
const blue = Color(0xFF1266F1);
const pale = Color(0xFFF4F8FC);

void main() => runApp(const DxvionApp());

class DxvionApp extends StatelessWidget {
  const DxvionApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dxvion Lifesciences',
      theme: ThemeData(useMaterial3: true, fontFamily: 'Arial', colorSchemeSeed: blue, scaffoldBackgroundColor: Colors.white),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void contact(BuildContext context) {
    showModalBottomSheet(context: context, showDragHandle: true, builder: (_) => const ContactSheet());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 20,
        title: const Row(children: [
          Icon(Icons.health_and_safety_rounded, color: blue, size: 30),
          SizedBox(width: 9),
          Text('DXVION', style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 1.5, color: navy)),
        ]),
        actions: [IconButton(onPressed: () => contact(context), icon: const Icon(Icons.mail_outline_rounded)), const SizedBox(width: 8)],
      ),
      body: ListView(children: [
        Container(color: pale, padding: const EdgeInsets.fromLTRB(24, 38, 24, 42), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('DELIVERING QUALITY HEALTHCARE BEYOND BORDERS', style: TextStyle(color: blue, fontWeight: FontWeight.w800, fontSize: 12, letterSpacing: 1.1)),
          const SizedBox(height: 14),
          const Text('Global Pharmaceutical Solutions Built on Quality & Trust', style: TextStyle(color: navy, fontSize: 34, height: 1.08, fontWeight: FontWeight.w800)),
          const SizedBox(height: 16),
          const Text('Dxvion Lifesciences works with trusted manufacturing partners to source and supply pharmaceutical products for international markets.', style: TextStyle(fontSize: 16, height: 1.55, color: Color(0xFF4B5D70))),
          const SizedBox(height: 24),
          FilledButton.icon(onPressed: () => contact(context), icon: const Icon(Icons.send_rounded), label: const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Text('Send an Enquiry'))),
        ])),
        const SectionHeader(kicker: 'ABOUT DXVION', title: 'Building Trust Through Quality & Reliability'),
        const Padding(padding: EdgeInsets.fromLTRB(24, 0, 24, 28), child: Text('Dxvion Lifesciences Pvt. Ltd. is an Indian pharmaceutical business focused on sourcing, supplying and exporting pharmaceutical products through trusted manufacturing partnerships.', style: TextStyle(fontSize: 16, height: 1.55, color: Color(0xFF4B5D70)))),
        const SectionHeader(kicker: 'OUR PORTFOLIO', title: 'Pharmaceutical Product Categories'),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Column(children: const [
          ProductTile(icon: Icons.medication_rounded, title: 'Tablets', text: 'Solid oral dosage forms across selected therapeutic categories.'),
          ProductTile(icon: Icons.local_pharmacy_rounded, title: 'Capsules', text: 'Capsule formulations sourced according to product and market requirements.'),
          ProductTile(icon: Icons.water_drop_rounded, title: 'Liquid Formulations', text: 'Selected syrup and oral liquid formulations.'),
          ProductTile(icon: Icons.vaccines_rounded, title: 'Injectables', text: 'Sterile products subject to product and market requirements.'),
          ProductTile(icon: Icons.healing_rounded, title: 'Topicals', text: 'Selected creams, ointments and topical formulations.'),
          ProductTile(icon: Icons.eco_rounded, title: 'Nutraceuticals', text: 'Selected nutrition and wellness products where appropriate.'),
        ])),
        Container(color: pale, margin: const EdgeInsets.only(top: 18), padding: const EdgeInsets.fromLTRB(24, 30, 24, 34), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('WHY DXVION', style: TextStyle(color: blue, fontWeight: FontWeight.w800, fontSize: 12, letterSpacing: 1.1)),
          SizedBox(height: 10),
          Text('A Practical Partner for Pharmaceutical Supply', style: TextStyle(color: navy, fontSize: 26, fontWeight: FontWeight.w800)),
          SizedBox(height: 20),
          Benefit(icon: Icons.verified_rounded, title: 'Quality Focus', text: 'Selected manufacturing relationships and attention to documentation.'),
          Benefit(icon: Icons.public_rounded, title: 'International Focus', text: 'Structured to support importers and distributors in international markets.'),
          Benefit(icon: Icons.inventory_2_rounded, title: 'Supply Coordination', text: 'Product requirements, commercial discussions, documentation and shipment planning.'),
          Benefit(icon: Icons.handshake_rounded, title: 'Long-Term Relationships', text: 'Clear communication, responsiveness and reliable execution.'),
        ])),
        const SectionHeader(kicker: 'HOW WE WORK', title: 'Simple. Transparent. Reliable.'),
        const Padding(padding: EdgeInsets.fromLTRB(24, 0, 24, 30), child: Column(children: [
          StepRow(number: '01', title: 'Requirement', text: 'Share product, quantity, destination and documentation requirements.'),
          StepRow(number: '02', title: 'Proposal', text: 'We review the requirement and discuss suitable options.'),
          StepRow(number: '03', title: 'Documentation', text: 'Product and commercial documentation is coordinated.'),
          StepRow(number: '04', title: 'Dispatch', text: 'Shipment planning and export coordination move forward.'),
        ])),
        Container(color: navy, padding: const EdgeInsets.fromLTRB(24, 34, 24, 38), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('HAVE A PHARMACEUTICAL REQUIREMENT?', style: TextStyle(color: Color(0xFF8FC1FF), fontWeight: FontWeight.w800, fontSize: 12, letterSpacing: 1.1)),
          const SizedBox(height: 12), const Text('Let’s start a conversation.', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800)),
          const SizedBox(height: 18), FilledButton.tonalIcon(onPressed: () => contact(context), icon: const Icon(Icons.mail_outline), label: const Text('Contact Dxvion')),
        ])),
        const Padding(padding: EdgeInsets.all(24), child: Text('© 2026 Dxvion Lifesciences Pvt. Ltd.\ninfo@dxvion.com\nPharmaceutical Supply & Exports', style: TextStyle(color: Color(0xFF607286), height: 1.6))),
      ]),
    );
  }
}

class SectionHeader extends StatelessWidget { final String kicker, title; const SectionHeader({super.key, required this.kicker, required this.title}); @override Widget build(BuildContext c) => Padding(padding: const EdgeInsets.fromLTRB(24, 34, 24, 14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(kicker, style: const TextStyle(color: blue, fontWeight: FontWeight.w800, fontSize: 12, letterSpacing: 1.1)), const SizedBox(height: 9), Text(title, style: const TextStyle(color: navy, fontSize: 27, height: 1.15, fontWeight: FontWeight.w800))])); }
class ProductTile extends StatelessWidget { final IconData icon; final String title, text; const ProductTile({super.key, required this.icon, required this.title, required this.text}); @override Widget build(BuildContext c) => Card(elevation: 0, color: pale, margin: const EdgeInsets.only(bottom: 10), child: ListTile(contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8), leading: CircleAvatar(backgroundColor: Colors.white, foregroundColor: blue, child: Icon(icon)), title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800, color: navy)), subtitle: Padding(padding: const EdgeInsets.only(top: 5), child: Text(text, style: const TextStyle(height: 1.4)))); }
class Benefit extends StatelessWidget { final IconData icon; final String title, text; const Benefit({super.key, required this.icon, required this.title, required this.text}); @override Widget build(BuildContext c) => Padding(padding: const EdgeInsets.only(bottom: 18), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(icon, color: blue), const SizedBox(width: 14), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.w800, color: navy)), const SizedBox(height: 3), Text(text, style: const TextStyle(height: 1.4))]))])); }
class StepRow extends StatelessWidget { final String number, title, text; const StepRow({super.key, required this.number, required this.title, required this.text}); @override Widget build(BuildContext c) => Padding(padding: const EdgeInsets.only(bottom: 18), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(number, style: const TextStyle(color: blue, fontWeight: FontWeight.w900, fontSize: 18)), const SizedBox(width: 18), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(color: navy, fontWeight: FontWeight.w800, fontSize: 16)), const SizedBox(height: 4), Text(text, style: const TextStyle(height: 1.4))]))])); }
class ContactSheet extends StatelessWidget { const ContactSheet({super.key}); @override Widget build(BuildContext c) => Padding(padding: const EdgeInsets.fromLTRB(24, 8, 24, 30), child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Contact Dxvion', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: navy)), const SizedBox(height: 8), const Text('For product sourcing, distribution, export or partnership enquiries.', style: TextStyle(height: 1.45)), const SizedBox(height: 18), const SelectableText('info@dxvion.com', style: TextStyle(color: blue, fontWeight: FontWeight.w700, fontSize: 17)), const SizedBox(height: 16), FilledButton(onPressed: () => Navigator.pop(c), child: const Text('Close'))])); }
