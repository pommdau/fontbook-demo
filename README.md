#  README
# Preview
- 実装が完成していないため色々問題があると思います。コードはあくまで参考まで。
- 取得方法がわからない項目に関しては❓としています。

<img width="859" alt="image" src="https://github.com/pommdau/fontbook-demo/assets/29433103/515192fa-1ecf-4fff-9b8c-88c625a1216d">

<img width="859" alt="image" src="https://github.com/pommdau/fontbook-demo/assets/29433103/c682f366-1831-4063-886a-726fa776cad0">

# References
- [CGFont](https://developer.apple.com/documentation/coregraphics/cgfont)
- [CTFont](https://developer.apple.com/documentation/coretext/ctfont-q6r)
    - [Font Attributes](https://developer.apple.com/documentation/coretext/ctfontdescriptor/font_attributes)
    - [Name Specifier Constants](https://developer.apple.com/documentation/coretext/ctfont/name_specifier_constants)
    - [Font Feature Constants](https://developer.apple.com/documentation/coretext/ctfont/font_feature_constants)    
    - [Font Variation Axis Dictionary Keys](https://developer.apple.com/documentation/coretext/ctfont/font_variation_axis_dictionary_keys)
- [NSFont](https://developer.apple.com/documentation/appkit/nsfont)
    - [NSFontDescriptor](https://developer.apple.com/documentation/appkit/nsfontdescriptor)
    - [NSFontDescriptor\.AttributeName](https://developer.apple.com/documentation/appkit/nsfontdescriptor/attributename)
    - [NSFontDescriptor\.FeatureKey](https://developer.apple.com/documentation/appkit/nsfontdescriptor/featurekey)
    - [NSFontDescriptor\.VariationKey](https://developer.apple.com/documentation/appkit/nsfontdescriptor/variationkey)
- CGFont to CTFont
    - [\[SwiftUI\] URLから取得したFontを使う](https://zenn.dev/en3_hcl/articles/4d6099ae8fd498)
    - [How do I get an NSFont object from a CGFont or CTFont object?](https://stackoverflow.com/questions/4942711/how-do-i-get-an-nsfont-object-from-a-cgfont-or-ctfont-object)
- [NSFontManager](https://developer.apple.com/documentation/appkit/nsfontmanager)
- [Variable Fontにまつわるフォントテクノロジー](https://qiita.com/usagimaru/items/0d3c66618df43df93345)
- [OpenType/CFFのフォントを読んでみる](https://nixeneko.hatenablog.com/entry/2018/06/20/000000)
    - フォント: https://github.com/prezly/noto-sans/blob/master/fonts/NotoSansCJKjp-Regular.otf    

>[フォントの生成とカスタマイズ](https://thinkit.co.jp/story/2014/09/02/5199)
>なお、UIFontとUIFontDescriptorはtoll-free型オブジェクトです。それぞれ、CTFont、CTFontDescriptorとの間でオブジェクトをキャストしてそのまま利用できます*1。

- `Embedded`に関してはOS/2テーブルのfsTypeだろう。ただし取得する方法が分からず。
    - [The 'OS/2' table](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM06/Chap6OS2.html)
    - https://learn.microsoft.com/ja-jp/typography/opentype/spec/os2#fstype
    - [埋め込めないフォントを埋め込むとどうなるか](https://zrbabbler.hatenablog.com/entry/20161016/1476593727)
