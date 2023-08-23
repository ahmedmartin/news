class NewsModel {
  String? _status;
  String? _source;
  String? _sortBy;
  List<Articles>? _articles;

  NewsModel(
      {String? status,
      String? source,
      String? sortBy,
      List<Articles>? articles}) {
    if (status != null) {
      this._status = status;
    }
    if (source != null) {
      this._source = source;
    }
    if (sortBy != null) {
      this._sortBy = sortBy;
    }
    if (articles != null) {
      this._articles = articles;
    }
  }

  String? get status => _status;
  set status(String? status) => _status = status;
  String? get source => _source;
  set source(String? source) => _source = source;
  String? get sortBy => _sortBy;
  set sortBy(String? sortBy) => _sortBy = sortBy;
  List<Articles>? get articles => _articles;
  set articles(List<Articles>? articles) => _articles = articles;

  NewsModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _source = json['source'];
    _sortBy = json['sortBy'];
    if (json['articles'] != null) {
      _articles = <Articles>[];
      json['articles'].forEach((v) {
        _articles!.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['source'] = this._source;
    data['sortBy'] = this._sortBy;
    if (this._articles != null) {
      data['articles'] = this._articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  String? _author;
  String? _title;
  String? _description;
  String? _url;
  String? _urlToImage;
  String? _publishedAt;

  Articles(
      {String? author,
      String? title,
      String? description,
      String? url,
      String? urlToImage,
      String? publishedAt}) {
    if (author != null) {
      this._author = author;
    }
    if (title != null) {
      this._title = title;
    }
    if (description != null) {
      this._description = description;
    }
    if (url != null) {
      this._url = url;
    }
    if (urlToImage != null) {
      this._urlToImage = urlToImage;
    }
    if (publishedAt != null) {
      this._publishedAt = publishedAt;
    }
  }

  String? get author => _author;
  set author(String? author) => _author = author;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get url => _url;
  set url(String? url) => _url = url;
  String? get urlToImage => _urlToImage;
  set urlToImage(String? urlToImage) => _urlToImage = urlToImage;
  String? get publishedAt => _publishedAt;
  set publishedAt(String? publishedAt) => _publishedAt = publishedAt;

  Articles.fromJson(Map<String, dynamic> json) {
    _author = json['author'];
    _title = json['title'];
    _description = json['description'];
    _url = json['url'];
    _urlToImage = json['urlToImage'];
    _publishedAt = json['publishedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this._author;
    data['title'] = this._title;
    data['description'] = this._description;
    data['url'] = this._url;
    data['urlToImage'] = this._urlToImage;
    data['publishedAt'] = this._publishedAt;
    return data;
  }
}
