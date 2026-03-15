import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart';
import 'package:printing/printing.dart';
import '../../../../data/models/invoice_item_model.dart';

class InvoicePdfHelper {

  // 1. دالة بناء ملف الـ PDF (المنطق الداخلي)
  static Future<pw.Document> _buildPdf(InvoiceModel invoice) async {
    final pdf = pw.Document();

    // محاولة تحميل الخط مع معالجة الخطأ لو الملف مش موجود
    final fontData = await rootBundle.load("assets/fonts/Cairo-Regular.ttf");
    final ttf = pw.Font.ttf(fontData);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        theme: pw.ThemeData.withFont(base: ttf),
        build: (pw.Context context) {
          return pw.Directionality(
            textDirection: pw.TextDirection.rtl,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Center(child: pw.Text("فاتورة مبيعات", style: pw.TextStyle(fontSize: 26, font: ttf))),
                pw.Divider(),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(" رقم الفاتورة: ${invoice.id}"),
                    pw.Text("التاريخ: ${invoice.date}"),
                  ],
                ),
                pw.Text("اسم العميل: ${invoice.customerName}"),
                pw.Text("رقم الهاتف: ${invoice.phone}"),
                pw.SizedBox(height: 20),
                pw.TableHelper.fromTextArray(
                  border: pw.TableBorder.all(),
                  headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, font: ttf),
                  cellAlignment: pw.Alignment.centerRight,
                  data: [
                    ['الإجمالي', 'السعر', 'الكمية', 'الصنف'],
                    ...invoice.items.map((item) => [
                      (item.quantity * item.sellingPrice).toString(),
                      item.sellingPrice.toString(),
                      item.quantity.toString(),
                      item.name,
                    ])
                  ],
                ),
                pw.Divider(),
                pw.Align(
                  alignment: pw.Alignment.centerLeft,
                  child: pw.Text("الإجمالي النهائي: ${invoice.total} ج.م",
                      style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold, font: ttf)),
                ),
              ],
            ),
          );
        },
      ),
    );
    return pdf;
  }

  // 2. دالة الطباعة المباشرة (زر الطباعة)
  static Future<void> printInvoice(InvoiceModel invoice) async {
    final pdf = await _buildPdf(invoice);
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
      name: 'print_invoice_${invoice.id}',
    );
  }

  // 3. دالة الحفظ كـ PDF (زر الـ PDF)
  static Future<void> saveAsPdf(InvoiceModel invoice) async {
    final pdf = await _buildPdf(invoice);
    // دي بتفتح نافذة الحفظ في الموبايل أو الكمبيوتر
    await Printing.sharePdf(
        bytes: await pdf.save(),
        filename: 'invoice_${invoice.id}.pdf'
    );
  }
}