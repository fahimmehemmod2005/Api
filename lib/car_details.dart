import 'package:api/data_model.dart';
import 'package:flutter/material.dart';

class CarDetailsPage extends StatelessWidget {
  final Data car;

  const CarDetailsPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(car.modelName ?? 'Car Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Car Basic Info
            _buildSection(
              title: 'CAR DETAILS',
              child: Column(
                children: [
                  _buildDataRow('ID', car.id),
                  _buildDataRow('Model Name', car.modelName),
                  _buildDataRow('Slug', car.slug),
                  _buildDataRow('Year', car.year?.toString()),
                  _buildDataRow('Price', car.price),
                ],
              ),
            ),

            // Manufacturer Info
            if (car.manufacturer != null) ...[
              const SizedBox(height: 16),
              _buildSection(
                title: 'MANUFACTURER',
                child: Column(
                  children: [
                    _buildDataRow('ID', car.manufacturer!.id),
                    _buildDataRow('Name', car.manufacturer!.name),
                    _buildDataRow('Country', car.manufacturer!.country),
                    _buildDataRow(
                      'Founded Year',
                      car.manufacturer!.foundedYear?.toString(),
                    ),
                  ],
                ),
              ),
            ],

            // Owner Info
            if (car.owner != null) ...[
              const SizedBox(height: 16),
              _buildSection(
                title: 'OWNER',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDataRow('ID', car.owner!.id),
                    _buildDataRow('First Name', car.owner!.firstName),
                    _buildDataRow('Last Name', car.owner!.lastName),
                    _buildDataRow('Email', car.owner!.email),
                    _buildDataRow('Phone', car.owner!.phoneNumber),

                    // Owner Occupations
                    if (car.owner!.occupations != null &&
                        car.owner!.occupations!.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      const Text(
                        'Occupations:',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...car.owner!.occupations!.asMap().entries.map((entry) {
                        final index = entry.key;
                        final occ = entry.value;
                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.blue.shade200),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Occupation ${index + 1}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(height: 4),
                              _buildDataRow('ID', occ.id, compact: true),
                              _buildDataRow('Title', occ.title, compact: true),
                              _buildDataRow(
                                'Description',
                                occ.description,
                                compact: true,
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ],
                ),
              ),
            ],

            // Engines Info
            if (car.engines != null && car.engines!.isNotEmpty) ...[
              const SizedBox(height: 16),
              _buildSection(
                title: 'ENGINES (${car.engines!.length})',
                child: Column(
                  children: car.engines!.asMap().entries.map((entry) {
                    final engineIndex = entry.key;
                    final engine = entry.value;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.blue.shade300,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'Engine ${engineIndex + 1}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          _buildDataRow('ID', engine.id),
                          _buildDataRow('Name', engine.name),
                          _buildDataRow(
                            'Displacement',
                            engine.displacement?.toString(),
                          ),
                          _buildDataRow(
                            'Horsepower',
                            engine.horsepower?.toString(),
                          ),

                          // Brand Info
                          if (engine.brand != null) ...[
                            const Divider(height: 24),
                            const Text(
                              'Brand Information:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  _buildDataRow(
                                    'ID',
                                    engine.brand!.id,
                                    compact: true,
                                  ),
                                  _buildDataRow(
                                    'Name',
                                    engine.brand!.name,
                                    compact: true,
                                  ),
                                  _buildDataRow(
                                    'Headquarters',
                                    engine.brand!.headquarters,
                                    compact: true,
                                  ),

                                  // Origin Info
                                  if (engine.brand!.origin != null) ...[
                                    const Divider(height: 16),
                                    const Text(
                                      'Origin Information:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: Colors.orange,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.orange.shade50,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        children: [
                                          _buildDataRow(
                                            'ID',
                                            engine.brand!.origin!.id,
                                            compact: true,
                                          ),

                                          // Destination Info
                                          if (engine
                                                  .brand!
                                                  .origin!
                                                  .destination !=
                                              null) ...[
                                            const Divider(height: 16),
                                            const Text(
                                              'Destination:',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Colors.purple,
                                              ),
                                            ),
                                            const SizedBox(height: 6),
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: Colors.purple.shade50,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Column(
                                                children: [
                                                  _buildDataRow(
                                                    'ID',
                                                    engine
                                                        .brand!
                                                        .origin!
                                                        .destination!
                                                        .id,
                                                    compact: true,
                                                  ),
                                                  _buildDataRow(
                                                    'Country',
                                                    engine
                                                        .brand!
                                                        .origin!
                                                        .destination!
                                                        .country,
                                                    compact: true,
                                                  ),
                                                  _buildDataRow(
                                                    'Latitude',
                                                    engine
                                                        .brand!
                                                        .origin!
                                                        .destination!
                                                        .latitude
                                                        ?.toString(),
                                                    compact: true,
                                                  ),
                                                  _buildDataRow(
                                                    'Longitude',
                                                    engine
                                                        .brand!
                                                        .origin!
                                                        .destination!
                                                        .longitude
                                                        ?.toString(),
                                                    compact: true,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required Widget child
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.blue.shade700,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(16), child: child),
        ],
      ),
    );
  }

  Widget _buildDataRow(
      String label,
      String? value,
      {
        bool compact = false
      }) {
    return Padding(
      padding: EdgeInsets.only(bottom: compact ? 6 : 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: compact ? 100 : 120,
            child: Text(
              '$label:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: compact ? 12 : 14,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value ?? 'N/A',
              style: TextStyle(
                fontSize: compact ? 12 : 14,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
