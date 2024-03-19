class Document {
  String? doc_title;
  String? doc_url;
  String? doc_date;
  int? page_num;
  
  Document(this.doc_title, this.doc_url, this.doc_date, this.page_num);

  static List<Document> doc_list = [
    Document(
      "SDGP CW 2 - Implementation Report Template and Guidelines", 
      "assets/SDGP.pdf", 
      "18-03-2024", 
      7,
    ),

    Document(
      "SDGP CW 2 - Implementation Report Template and Guidelines", 
      "assets/SDGP.pdf", 
      "18-03-2024", 
      7,
    ),

    Document(
      "SDGP CW 2 - Implementation Report Template and Guidelines", 
      "assets/SDGP.pdf", 
      "18-03-2024", 
      7,
    ),

    
  ];

}