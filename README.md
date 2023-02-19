# IGsights
<img src="https://user-images.githubusercontent.com/62511320/219944315-e7c7d62d-3164-435a-b1da-5214894e6f23.png" width=50%>


インサイト一覧画面|ソート機能|投稿内容詳細画面
--|--|--
![Screenshot_20230219-192500](https://user-images.githubusercontent.com/62511320/219942546-f657832a-4c18-4889-9038-620b917efac0.png)|![Screenshot_20230219-192514](https://user-images.githubusercontent.com/62511320/219942543-50528c97-ba29-462c-b970-18a0bdb60f8f.png)|![Screenshot_20230219-192538](https://user-images.githubusercontent.com/62511320/219942539-72c51378-2ba6-48e2-ba41-7d8958079574.png)

## アーキテクチャー
- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod) + [go_router](https://pub.dev/packages/go_router)
<img src="https://user-images.githubusercontent.com/62511320/219945912-7e02716f-8e11-4ca1-9eb7-8a72a0a3491f.jpg" width=60%>

## CI (継続的インテグレーション)
GitHub Actions を利用して CI を構築しています。

発火タイミング|実行内容
--|--|
developにマージ<br>PR作成・更新|コードフォーマット<br>静的解析（flutter analyze）<br>テスト（flutter test）
