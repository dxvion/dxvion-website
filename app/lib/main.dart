import 'package:flutter/material.dart';

const navy = Color(0xFF0B1F33);
const blue = Color(0xFF1266F1);
const pale = Color(0xFFF4F8FC);

void main() => runApp(const DxvionApp());

class Product {
  final String category;
  final String title;
  final String description;
  const Product(this.category, this.title, this.description);
}

const products = <Product>[
  Product('Tablets', 'Tablets Portfolio', 'Solid oral dosage forms across selected therapeutic categories. Product, strength, pack and market availability are confirmed on enquiry.'),
  Product('Capsules', 'Capsules Portfolio', 'Capsule formulations sourced according to product specifications, destination market and documentation requirements.'),
  Product('Liquid Formulations', 'Liquid Formulations', 'Selected syrups and oral liquid formulations subject to product and market requirements.'),
  Product('Injectables', 'Injectables Portfolio', 'Sterile injectable products subject to specific manufacturing, documentation and destination-market requirements.'),
  Product('Topicals', 'Topicals Portfolio', 'Selected creams, ointments and topical pharmaceutical formulations.'),
  Product('Nutraceuticals', 'Nutraceuticals Portfolio', 'Selected nutrition and wellness products where appropriate for the target market.'),
];

class DxvionApp extends StatelessWidget {
  const DxvionApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Dxvion Lifesciences',
    theme: ThemeData(useMaterial3: true, fontFamily: 'Arial', colorSchemeSeed: blue, scaffoldBackgroundColor: Colors.white),
    home: const HomePage(),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String query = '';
  List<Product> get filtered => products.where((p) => '${p.category} ${p.title} ${p.description}'.toLowerCase().contains(query.toLowerCase())).toList();

  void openEnquiry([Product? product]) => Navigator.push(context, MaterialPageRoute(builder: (_) => EnquiryPage(product: product)));

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      titleSpacing: 20,
      title: const Row(children: [Icon(Icons.health_and_safety_rounded, color: blue, size: 30), SizedBox(width: 9), Text('DXVION', style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 1.5, color: navy))]),
      actions: [IconButton(onPressed: openEnquiry, icon: const Icon(Icons.mail_outline_rounded)), const SizedBox(width: 8)],
    ),
    body: ListView(children: [
      Container(color: pale, padding: const EdgeInsets.fromLTRB(24, 38, 24, 42), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('DELIVERING QUALITY HEALTHCARE BEYOND BORDERS', style: TextStyle(color: blue, fontWeight: FontWeight.w800, fontSize: 12, letterSpacing: 1.1)),
        const SizedBox(height: 14),
        const Text('Global Pharmaceutical Solutions Built on Quality & Trust', style: TextStyle(color: navy, fontSize: 34, height: 1.08, fontWeight: FontWeight.w800)),
        const SizedBox(height: 16),
        const Text('Dxvion Lifesciences Pvt. Ltd. works with trusted manufacturing partners to source and supply pharmaceutical products for international markets.', style: TextStyle(fontSize: 16, height: 1.55, color: Color(0xFF4B5D70))),
        const SizedBox(height: 24),
        FilledButton.icon(onPressed: openEnquiry, icon: const Icon(Icons.send_rounded), label: const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Text('Send an Enquiry'))),
      ])),
      const SectionHeader(kicker: 'ABOUT DXVION', title: 'Building Trust Through Quality & Reliability'),
      const Padding(padding: EdgeInsets.fromLTRB(24, 0, 24, 28), child: Text('Dxvion Lifesciences Pvt. Ltd. is an Indian pharmaceutical business focused on sourcing, supplying and exporting pharmaceutical products through trusted manufacturing partnerships.', style: TextStyle(fontSize: 16, height: 1.55, color: Color(0xFF4B5D70)))),
      const SectionHeader(kicker: 'OUR PORTFOLIO', title: 'Find the Right Product Category'),
      Padding(padding: const EdgeInsets.fromLTRB(16, 0, 16, 12), child: TextField(onChanged: (v) => setState(() => query = v), decoration: InputDecoration(prefixIcon: const Icon(Icons.search), hintText: 'Search products or categories', filled: true, fillColor: pale, border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none)))),
      Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Column(children: filtered.map((p) => ProductTile(product: p, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductPage(product: p),)), onEnquire: () => openEnquiry(p))).toList())),
      if (filtered.isEmpty) const Padding(padding: EdgeInsets.all(28), child: Center(child: Text('No matching category found. Send us your requirement and we will review it.'))),
      Container(color: pale, margin: const EdgeInsets.only(top: 18), padding: const EdgeInsets.fromLTRB(24, 30, 24, 34), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('WHY DXVION', style: TextStyle(color: blue, fontWeight: FontWeight.w800, fontSize: 12, letterSpacing: 1.1)),
        SizedBox(height: 10), Text('A Practical Partner for Pharmaceutical Supply', style: TextStyle(color: navy, fontSize: 26, fontWeight: FontWeight.w800)), SizedBox(height: 20),
        Benefit(icon: Icons.verified_rounded, title: 'Quality Focus', text: 'Selected manufacturing relationships and attention to documentation.'),
        Benefit(icon: Icons.public_rounded, title: 'International Focus', text: 'Structured to support importers and distributors in international markets.'),
        Benefit(icon: Icons.inventory_2_rounded, title: 'Supply Coordination', text: 'Product requirements, commercial discussions, documentation and shipment planning.'),
        Benefit(icon: Icons.handshake_rounded, title: 'Long-Term Relationships', text: 'Clear communication, responsiveness and reliable execution.'),
      ])),
      const SectionHeader(kicker: 'HOW WE WORK', title: 'Simple. Transparent. Reliable.'),
      const Padding(padding: EdgeInsets.fromLTRB(24, 0, 24, 30), child: Column(children: [StepRow(number: '01', title: 'Requirement', text: 'Share product, quantity, destination and documentation requirements.'), StepRow(number: '02', title: 'Proposal', text: 'We review the requirement and discuss suitable options.'), StepRow(number: '03', title: 'Documentation', text: 'Product and commercial documentation is coordinated.'), StepRow(number: '04', title: 'Dispatch', text: 'Shipment planning and export coordination move forward.') ])),
      Container(color: navy, padding: const EdgeInsets.fromLTRB(24, 34, 24, 38), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('HAVE A PHARMACEUTICAL REQUIREMENT?', style: TextStyle(color: Color(0xFF8FC1FF), fontWeight: FontWeight.w800, fontSize: 12, letterSpacing: 1.1)), const SizedBox(height: 12), const Text('Let’s start a conversation.', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800)), const SizedBox(height: 18), FilledButton.tonalIcon(onPressed: openEnquiry, icon: const Icon(Icons.mail_outline), label: const Text('Contact Dxvion'))])),
      const Padding(padding: EdgeInsets.all(24), child: Text('© 2026 Dxvion Lifesciences Pvt. Ltd.\ninfo@dxvion.com\nPharmaceutical Supply & Exports', style: TextStyle(color: Color(0xFF607286), height: 1.6))),
    ]),
  );
}

class ProductPage extends StatelessWidget {
  final Product product;
  const ProductPage({super.key, required this.product});
  @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text(product.category)), body: ListView(padding: const EdgeInsets.all(24), children: [
    CircleAvatar(radius: 36, backgroundColor: pale, foregroundColor: blue, child: const Icon(Icons.medication_rounded, size: 34)), const SizedBox(height: 22),
    Text(product.title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: navy)), const SizedBox(height: 14),
    Text(product.description, style: const TextStyle(fontSize: 16, height: 1.6, color: Color(0xFF4B5D70))), const SizedBox(height: 28),
    const InfoCard(title: 'Availability', text: 'Please enquire with the required molecule, strength, dosage form, pack size, quantity and destination market.'),
    const InfoCard(title: 'Documentation', text: 'Documentation and regulatory requirements are reviewed according to the product and destination market.'),
    const SizedBox(height: 16), FilledButton.icon(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => EnquiryPage(product: product))), icon: const Icon(Icons.send), label: const Padding(padding: EdgeInsets.symmetric(vertical: 14), child: Text('Enquire About This Category'))),
  ]));
}

class EnquiryPage extends StatefulWidget {
  final Product? product;
  const EnquiryPage({super.key, this.product});
  @override State<EnquiryPage> createState() => _EnquiryPageState();
}
class _EnquiryPageState extends State<EnquiryPage> {
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController(); final email = TextEditingController(); final company = TextEditingController(); final country = TextEditingController(); final quantity = TextEditingController(); final message = TextEditingController();
  @override void dispose() { name.dispose(); email.dispose(); company.dispose(); country.dispose(); quantity.dispose(); message.dispose(); super.dispose(); }
  @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Business Enquiry')), body: Form(key: formKey, child: ListView(padding: const EdgeInsets.all(24), children: [
    const Text('Tell us what you need', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: navy)), const SizedBox(height: 8),
    const Text('For product sourcing, distribution, export or partnership enquiries.', style: TextStyle(height: 1.5)), const SizedBox(height: 24),
    Field(controller: name, label: 'Full Name', requiredField: true), Field(controller: email, label: 'Email Address', keyboard: TextInputType.emailAddress, requiredField: true), Field(controller: company, label: 'Company Name'), Field(controller: country, label: 'Country'), Field(controller: quantity, label: 'Quantity / Pack Requirement'),
    if (widget.product != null) Padding(padding: const EdgeInsets.only(bottom: 12), child: InputDecorator(decoration: const InputDecoration(labelText: 'Product Category', border: OutlineInputBorder()), child: Text(widget.product!.category))),
    TextFormField(controller: message, minLines: 5, maxLines: 8, decoration: const InputDecoration(labelText: 'Your Requirement', hintText: 'Molecule, strength, dosage form, destination, documentation and any other details', border: OutlineInputBorder()), validator: (v) => (v == null || v.trim().isEmpty) ? 'Please describe your requirement' : null),
    const SizedBox(height: 20),
    FilledButton.icon(onPressed: () { if (formKey.currentState!.validate()) showDialog(context: context, builder: (_) => AlertDialog(title: const Text('Enquiry Ready'), content: const Text('Your enquiry details have been captured. Connect the app to Dxvion’s enquiry backend/email endpoint before production launch so submissions can be delivered automatically.'), actions: [TextButton(onPressed: () => Navigator.popUntil(context, (r) => r.isFirst), child: const Text('Done'))])); }, icon: const Icon(Icons.send), label: const Padding(padding: EdgeInsets.symmetric(vertical: 14), child: Text('Submit Enquiry'))),
    const SizedBox(height: 12), const Text('Dxvion Lifesciences Pvt. Ltd. • info@dxvion.com', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF607286))),
  ]));
}

class Field extends StatelessWidget { final TextEditingController controller; final String label; final bool requiredField; final TextInputType? keyboard; const Field({super.key, required this.controller, required this.label, this.requiredField = false, this.keyboard}); @override Widget build(BuildContext c) => Padding(padding: const EdgeInsets.only(bottom: 12), child: TextFormField(controller: controller, keyboardType: keyboard, decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()), validator: requiredField ? (v) => (v == null || v.trim().isEmpty) ? 'Required' : null : null)); }

class InfoCard extends StatelessWidget { final String title, text; const InfoCard({super.key, required this.title, required this.text}); @override Widget build(BuildContext c) => Card(elevation: 0, color: pale, margin: const EdgeInsets.only(bottom: 12), child: Padding(padding: const EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.w800, color: navy)), const SizedBox(height: 6), Text(text, style: const TextStyle(height: 1.45))]))); }
class SectionHeader extends StatelessWidget { final String kicker, title; const SectionHeader({super.key, required this.kicker, required this.title}); @override Widget build(BuildContext c) => Padding(padding: const EdgeInsets.fromLTRB(24, 34, 24, 14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(kicker, style: const TextStyle(color: blue, fontWeight: FontWeight.w800, fontSize: 12, letterSpacing: 1.1)), const SizedBox(height: 9), Text(title, style: const TextStyle(color: navy, fontSize: 27, height: 1.15, fontWeight: FontWeight.w800))])); }
class ProductTile extends StatelessWidget { final Product product; final VoidCallback onTap, onEnquire; const ProductTile({super.key, required this.product, required this.onTap, required this.onEnquire}); @override Widget build(BuildContext c) => Card(elevation: 0, color: pale, margin: const EdgeInsets.only(bottom: 10), child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(12), child: Padding(padding: const EdgeInsets.all(16), child: Row(children: [CircleAvatar(backgroundColor: Colors.white, foregroundColor: blue, child: const Icon(Icons.medication_rounded)), const SizedBox(width: 14), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(product.title, style: const TextStyle(fontWeight: FontWeight.w800, color: navy)), const SizedBox(height: 5), Text(product.description, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(height: 1.35))])), IconButton(onPressed: onEnquire, tooltip: 'Enquire', icon: const Icon(Icons.arrow_forward_rounded, color: blue))]))); }
class Benefit extends StatelessWidget { final IconData icon; final String title, text; const Benefit({super.key, required this.icon, required this.title, required this.text}); @override Widget build(BuildContext c) => Padding(padding: const EdgeInsets.only(bottom: 18), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(icon, color: blue), const SizedBox(width: 14), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.w800, color: navy)), const SizedBox(height: 3), Text(text, style: const TextStyle(height: 1.4))]))])); }
class StepRow extends StatelessWidget { final String number, title, text; const StepRow({super.key, required this.number, required this.title, required this.text}); @override Widget build(BuildContext c) => Padding(padding: const EdgeInsets.only(bottom: 18), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(number, style: const TextStyle(color: blue, fontWeight: FontWeight.w900, fontSize: 18)), const SizedBox(width: 18), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(color: navy, fontWeight: FontWeight.w800, fontSize: 16)), const SizedBox(height: 4), Text(text, style: const TextStyle(height: 1.4))]))])); }
