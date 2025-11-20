// import 'package:flutter/material.dart';
// import 'package:raval/core/config/app_styles.dart';
// import 'package:raval/features/language/presentation/provider/language_provider.dart';
// import 'package:raval/features/orders/domain/entity/order_entity.dart';
// import 'package:intl/intl.dart';

// class OrderStatusWidget extends StatelessWidget {
//   final OrderStatus status;
//   final DateTime? orderDate;
  
//   const OrderStatusWidget({
//     super.key, 
//     required this.status,
//     this.orderDate,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final statusSteps = _getStatusSteps(context);
    
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             LanguageProvider.translate("global", "order_status"),
//             style: AppStyles.style16Normal.copyWith(
//               fontWeight: FontWeight.w600,
//               color: Colors.black87,
//             ),
//           ),
//           const SizedBox(height: 16),
//           ...statusSteps.asMap().entries.map((entry) {
//             final index = entry.key;
//             final step = entry.value;
//             final isLast = index == statusSteps.length - 1;
//             final isCompleted = _isStepCompleted(step['status']);
//             final isCurrent = status == step['status'];
            
//             return _buildStep(
//               title: step['title'],
//               description: isCurrent ? step['description'] : null,
//               icon: step['icon'],
//               iconColor: isCompleted ? status.color : Colors.grey[300]!,
//               isCompleted: isCompleted,
//               isCurrent: isCurrent,
//               isLast: isLast,
//               date: _getFormattedDate(step['status']),
//             );
//           }).toList(),
//         ],
//       ),
//     );
//   }

//   bool _isStepCompleted(OrderStatus stepStatus) {
//     final statusLevel = status.level;
//     final stepLevel = stepStatus.level;
//     return statusLevel >= stepLevel;
//   }
  
//   String _getFormattedDate(OrderStatus stepStatus) {
//     if (orderDate == null) return '';
    
//     final now = DateTime.now();
//     final difference = now.difference(orderDate!).inDays;
    
//     if (difference == 0) {
//       return LanguageProvider.translate("global", "today");
//     } else if (difference == 1) {
//       return LanguageProvider.translate("global", "yesterday");
//     } else {
//       return DateFormat('dd MMM yyyy').format(orderDate!);
//     }
//   }
  
//   List<Map<String, dynamic>> _getStatusSteps(BuildContext context) {
//     return [
//       {
//         'status': OrderStatus.pending,
//         'title': LanguageProvider.translate("global", "order_placed"),
//         'description': LanguageProvider.translate("global", "order_placed_desc"),
//         'icon': Icons.shopping_bag_outlined,
//       },
//       {
//         'status': OrderStatus.accepted,
//         'title': LanguageProvider.translate("global", "order_accepted"),
//         'description': LanguageProvider.translate("global", "order_accepted_desc"),
//         'icon': Icons.check_circle_outline,
//       },
//       {
//         'status': OrderStatus.inProgress,
//         'title': LanguageProvider.translate("global", "in_progress"),
//         'description': LanguageProvider.translate("global", "in_progress_desc"),
//         'icon': Icons.build_circle_outlined,
//       },
//       {
//         'status': OrderStatus.delivery,
//         'title': LanguageProvider.translate("global", "out_for_delivery"),
//         'description': LanguageProvider.translate("global", "out_for_delivery_desc"),
//         'icon': Icons.local_shipping_outlined,
//       },
//       {
//         'status': OrderStatus.completed,
//         'title': LanguageProvider.translate("global", "delivered"),
//         'description': LanguageProvider.translate("global", "order_delivered_desc"),
//         'icon': Icons.verified_outlined,
//       },
//     ];
//   }

//   Widget _buildStep({
//     required String title,
//     required String date,
//     required IconData icon,
//     required Color iconColor,
//     String? description,
//     bool isCompleted = false,
//     bool isCurrent = false,
//     bool isLast = false,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Timeline indicator
//           Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: isCompleted || isCurrent 
//                       ? iconColor.withOpacity(0.1) 
//                       : Colors.grey[100],
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: isCompleted || isCurrent ? iconColor : Colors.grey[300]!,
//                     width: 1.5,
//                   ),
//                 ),
//                 child: Icon(
//                   icon,
//                   size: 20,
//                   color: isCompleted ? iconColor : Colors.grey[400],
//                 ),
//               ),
//               if (!isLast)
//                 Container(
//                   width: 2,
//                   height: 40,
//                   color: isCompleted ? iconColor : Colors.grey[300],
//                 ),
//             ],
//           ),
          
//           const SizedBox(width: 16),
          
//           // Content
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       title,
//                       style: AppStyles.style16Normal.copyWith(
//                         color: isCurrent || isCompleted ? Colors.black87 : Colors.grey[600],
//                         fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
//                       ),
//                     ),
//                     if (date.isNotEmpty)
//                       Text(
//                         date,
//                         style: AppStyles.style13Normal.copyWith(
//                           color: Colors.grey[500],
//                         ),
//                       ),
//                   ],
//                 ),
//                 if (description != null) ...[
//                   const SizedBox(height: 4),
//                   Text(
//                     description,
//                     style: AppStyles.style13Normal.copyWith(
//                       color: Colors.grey[700],
//                       height: 1.4,
//                     ),
//                   ),
//                 ],
//                 if (isCurrent) ...[
//                   const SizedBox(height: 8),
//                   LinearProgressIndicator(
//                     value: _getProgressValue(),
//                     backgroundColor: Colors.grey[200],
//                     valueColor: AlwaysStoppedAnimation<Color>(status.color),
//                     minHeight: 6,
//                     borderRadius: BorderRadius.circular(3),
//                   ),
//                 ],
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
  
//   double _getProgressValue() {
//     switch (status) {
//       case OrderStatus.pending:
//         return 0.2;
//       case OrderStatus.accepted:
//         return 0.4;
//       case OrderStatus.inProgress:
//         return 0.6;
//       case OrderStatus.delivery:
//         return 0.8;
//       case OrderStatus.completed:
//       case OrderStatus.cancelled:
//       case OrderStatus.adminCancelled:
//         return 1.0;
//     }
//   }
// }
