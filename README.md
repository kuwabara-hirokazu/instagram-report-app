# IGsights
<img src="https://user-images.githubusercontent.com/62511320/219944315-e7c7d62d-3164-435a-b1da-5214894e6f23.png" width=50%>

## 主なアプリ機能
### インサイト一覧画面
- ページング機能
- ソート機能
- フィルター機能
### 投稿内容詳細画面
- Instagram投稿ページのWebView表示機能

インサイト一覧画面|ソート機能|投稿内容詳細画面
--|--|--
![Screenshot_20230219-192500](https://user-images.githubusercontent.com/62511320/219942546-f657832a-4c18-4889-9038-620b917efac0.png)|![Screenshot_20230219-192514](https://user-images.githubusercontent.com/62511320/219942543-50528c97-ba29-462c-b970-18a0bdb60f8f.png)|![Screenshot_20230219-192538](https://user-images.githubusercontent.com/62511320/219942539-72c51378-2ba6-48e2-ba41-7d8958079574.png)

## 技術スタック
- 状態管理
    - [flutter_riverpod v2](https://pub.dev/packages/flutter_riverpod)
- Remote
  - [firebase_core](https://pub.dev/packages/firebase_core)
  - [cloud_firestore](https://pub.dev/packages/cloud_firestore)
- ルーティング
    - [go_router](https://pub.dev/packages/go_router)
    - [go_router_builder](https://pub.dev/packages/go_router_builder)
- クラス設計
    - [freezed](https://pub.dev/packages/freezed)
- アプリアイコン
    - [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)
- Webブラウザ表示
    - [url_launcher](https://pub.dev/packages/url_launcher)
- Unitテスト
    - [fake_cloud_firestore](https://pub.dev/packages/fake_cloud_firestore/example)
- CI(自動テスト)
    - [GitHub Actions](https://github.co.jp/features/actions)
- サポートするプラットフォーム
    - iOS / Android

## アーキテクチャー
- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod) + [go_router](https://pub.dev/packages/go_router)
<img src="https://user-images.githubusercontent.com/62511320/219945912-7e02716f-8e11-4ca1-9eb7-8a72a0a3491f.jpg" width=60%>

### DataSourceについて
インサイト集計データはFirestoreで保管。
(GASで[InstagramグラフAPI](https://developers.facebook.com/docs/instagram-api)を叩いて取得したデータをFirestoreに保存している)

GASプログラムについては[こちら](https://github.com/kuwabara-hirokazu/instagram_insight)


## CI (継続的インテグレーション)
GitHub Actions を利用して CI を構築。

発火タイミング|実行内容
--|--|
developにマージ<br>PR作成・更新|コードフォーマット<br>静的解析（flutter analyze）<br>テスト（flutter test）
