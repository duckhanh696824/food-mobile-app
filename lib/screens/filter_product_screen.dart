import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class FilterProductScreen extends StatefulWidget {
  final void Function(String?) onApplyFilter;

  const FilterProductScreen({super.key, required this.onApplyFilter});

  @override
  State<FilterProductScreen> createState() => _FilterProductScreenState();
}

class _FilterProductScreenState extends State<FilterProductScreen> {
  String? selectedPriceOption;
  String? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  IconlyLight.filter,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  "Lọc sản phẩm",
                  style: TextStyle(
                    fontWeight: FontWeight.w600, // Font chữ đậm hơn
                    fontSize: 18,
                    color: Theme.of(context)
                        .primaryColor, // Màu chính của theme// Sử dụng màu chữ giống nút "Áp dụng"
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(
                height:
                    8), // Tăng khoảng cách giữa tiêu đề và tùy chọn đầu tiên
            const Text(
              "Lọc theo giá",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
                height:
                    4), // Giảm khoảng cách giữa tiêu đề và tùy chọn đầu tiên
            RadioListTile<String>(
              title: const Text("Giá tăng dần"),
              value: "asc",
              groupValue: selectedPriceOption,
              contentPadding: EdgeInsets.zero, // Loại bỏ padding mặc định
              dense: true, // Giảm chiều cao item
              onChanged: (value) {
                setState(() {
                  selectedPriceOption = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text("Giá giảm dần"),
              value: "desc",
              groupValue: selectedPriceOption,
              contentPadding: EdgeInsets.zero,
              dense: true,
              onChanged: (value) {
                setState(() {
                  selectedPriceOption = value;
                });
              },
            ),
            const SizedBox(height: 16), // Tăng khoảng cách giữa các mục
            const Text(
              "Lọc theo địa điểm",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
                height:
                    4), // Tăng khoảng cách giữa tiêu đề và tùy chọn đầu tiên
            RadioListTile<String>(
              title: const Text("TP.HCM"),
              value: "HCM",
              groupValue: selectedLocation,
              contentPadding: EdgeInsets.zero,
              dense: true,
              onChanged: null, // Không xử lý
            ),
            RadioListTile<String>(
              title: const Text("Hà Nội"),
              value: "HN",
              groupValue: selectedLocation,
              contentPadding: EdgeInsets.zero,
              dense: true,
              onChanged: null, // Không xử lý
            ),
            RadioListTile<String>(
              title: const Text("Vũng Tàu"),
              value: "VT",
              groupValue: selectedLocation,
              contentPadding: EdgeInsets.zero,
              dense: true,
              onChanged: null, // Không xử lý
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        selectedPriceOption = null;
                        selectedLocation = null;
                      });
                    },
                    icon: const Icon(Icons.restart_alt),
                    label: const Text(
                      "Thiết lập lại",
                      style: TextStyle(
                        fontWeight: FontWeight.w600, // Tăng độ dày font chữ
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade300, // Màu xám nhạt
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      widget.onApplyFilter(selectedPriceOption);
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Áp dụng",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white // Tăng độ dày font chữ
                          ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromRGBO(59, 105, 57, 1), // Màu xám nhạt
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
