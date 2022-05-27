# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin@mail.com',
  password: 'admin111'
  )

Genre.create!(name: "和食")
Genre.create!(name: "洋食")
Genre.create!(name: "中華")
Genre.create!(name: "その他")

# ダミーユーザー
2.times do |n|
  Customer.create!(
    name: "テストユーザー#{n + 1}",
    email: "test#{n + 1}@test.com",
    password: "test111",
    encrypted_password: "test111"
    )
end

# 献立
# 朝食（customer_id:1）
Menu.create!(customer_id: 1,image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/jp-simple.jpg"), filename:"simple"),food_status: 0, genre_id: 1, name:"シンプル朝ごはん", syusyoku:"ごはん", syusai:"お好みで", fukusai:"味噌汁",
introduction:"（材料）
米：適量
水：1200cc~
味噌：適量
ワカメ：適量
大根：1/3
だし：小さじ１
胡麻：適量

（作り方）
1.お米を洗い、炊飯器に入れて炊く
2.大根をお好みのサイズにカット
3.お鍋に水を約1200cc入れ大根を入れる
4. 大根が柔らかくなってきたら、味噌、だし、ワカメを入れる
5.味噌汁を盛り付けて、お好みでごはんに胡麻を乗せる")

Menu.create!(customer_id: 1,image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/egg-bread.jpg"), filename:"egg-bread"),food_status: 0, genre_id: 2, name:"卵とアボカドのトースト", syusyoku:"パン", syusai:"なし", fukusai:"なし",
introduction:"（材料）
食パン：1枚
アボカド：1/2個
卵：1個
塩こしょう：少々
オリーブオイル：小さじ2
有塩バター：適量

（作り方）
1.アボカドは半分に切って、皮と種を取り、縦切りにする。
2.卵をフライパンで焼く。
3.うどんを器に盛り付けて、つゆをかける
4.トーストした食パンにバターを塗り、アボカド、卵をのせる。お好みでマヨネーズと塩こしょうをかけ完成。 ")

Menu.create!(customer_id: 1,image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/okayu.jpg"), filename:"okayu"),food_status: 0, genre_id: 3, name:"水菜と明太子の「香港がゆ」", syusyoku:"おかゆ", syusai:"なし", fukusai:"明太子",
introduction:"（材料）
米：100g
生姜：1片
水：1000ml
酒：大さじ1
塩：小さじ1
鶏ガラスープの素：小さじ1/2
水菜：適量
明太子：適量

（作り方）
1.生姜の皮を剥いて千切りにし、水にさらしておきます。
2.米を研ぎ、30分吸水させて水気を切ります。
3.鶏ガラスープの素と黒こしょうを混ぜておきます
4.沸騰させ、2を入れて再び沸騰したら、かき混ぜながら弱火で40分程煮ます。器に盛り付け,
  水菜と明太子をお好みでトッピング")

Menu.create!(customer_id: 1,image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/smoothie.jpg"), filename:"smoothie"),food_status: 0, genre_id: 4, name:"健康スムージー", syusyoku:"スムージー", syusai:"なし", fukusai:"なし",
introduction:"（材料）
バナナ:1/2本
リンゴ:1/8個
小松菜:1/2~1房
牛乳:150cc

（作り方）
1.常備】熟したバナナは1㎝の輪切り5~6個ずつラップで包みジッパーバッグに入れて冷蔵庫で凍らせておく。
2.【常備】リンゴは8つのくし形に切り、さらに1㎝の厚さに切ってジッパーバッグに入れて冷凍しておく。
3.小松菜1/2~1房を3㎝幅に切る
4.リンゴ5~6切れ、バナナラップ1包み、小松菜と牛乳、をミキサーにいれる。
5.固形物がなくなるまで1~2分ミキサーにかける。")


# 昼食
Menu.create!(customer_id: 1,image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/udon.jpg"), filename:"udon"),food_status: 1, genre_id: 1, name:"シンプルうどん", syusyoku:"うどん", syusai:"なし", fukusai:"漬物",
introduction:"（材料）
うどん：一袋
水：2・1/2カップ
しょうゆ：大さじ2
「ほんだし」：小さじ2
酒：小さじ1
みりん：小さじ1/2
小ねぎの小口切り：適量

（作り方）
1.水、しょうゆ、ほんだし、酒、みりんを混ぜる
2.うどんを茹でる
3.うどんを器に盛り付けて、つゆをかける
4.お好みでネギをトッピング ")

Menu.create!(customer_id: 1,image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/meat-spaghetti.jpg"), filename:"meat-spaghetti"),food_status: 1, genre_id: 2, name:"ミートパスタ（二人分）", syusyoku:"パスタ", syusai:"なし", fukusai:"なし",
introduction:"（材料）
スパゲッティ：160g（2束）
塩：適量
（ミートソース）
玉ねぎ：1/2個
にんじん：1/2本
にんにく：1片
オリーブオイル：大さじ1
合い挽き肉：150g
薄力粉：大さじ1
カットトマト缶：1缶(400g)
塩：少々
こしょう：少々
コンソメ：小さじ2

（作り方）
1.玉ねぎ、にんじん、にんにくをみじん切りにする
2.フライパンにオリーブオイルを入れて熱し、にんにくを弱火で炒める
3.香りがでてきたら、玉ねぎ、にんじんを加えて中火で炒める
4.野菜がしんなりしてきたら、合い挽き肉を加えて炒める。合い挽き肉の色が変わってきたら、さらに薄力粉を加えて炒める。
5.カットトマト缶、塩、こしょう、コンソメを加えて味を整え、とろみがつくまで煮込む。
6.鍋に塩を適量入れ、スパゲッティを表示時間通りに茹でる
7.スパゲッティの水気を切り、器に盛り付けたら完成")

Menu.create!(customer_id: 1,image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/dumpling.jpg"), filename:"dumpling"),food_status: 1, genre_id: 3, name:"餃子", syusyoku:"ごはん", syusai:"餃子", fukusai:"卵スープ",
introduction:"（材料）
豚ひき肉：300g
白菜（キャベツ）：300g
もやし：2袋
ニラ：1束
餃子の皮：80個分
☆中華スープの素：大さじ1
☆みそ：大さじ1
☆チューブにんにく：小さじ1
☆卵：２個

（作り方）
1.豚ひき肉に☆印の調味料を入れて粘りが出るまで混ぜます。
2.白菜はみじん切りにして塩もみ（分量外）し、ニラともやしはみじん切りします。
3.白菜がしんなりしたら、水気をしっかり絞り、野菜と肉を混ぜ合わせます。
4.市販の餃子の皮に包みます。
5.熱したホットプレートに油を引いて並べます。2～3分、裏面にいい焼き色が付くのを待ちます。
6.餃子の高さの3分の1位まで熱湯を入れ、蒸し焼きにします。蓋を開けて、水気を飛ばしたら完成!!")

Menu.create!(customer_id: 1,image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/thai-noodle.jpg"), filename:"thai-noodle"),food_status: 1, genre_id: 4, name:"やみつきタイ料理！ヤムウンセン", syusyoku:"ヤムウンセン", syusai:"なし", fukusai:"なし",
introduction:"（材料）
豚ひき肉：100g
むきえび：100g
セロリ：1/2本
きゅうり：1本
玉ねぎ：1/4個
塩：適量
おろしにんにく：適量
おろししょうが：適量
ごま油：大さじ1/2
塩こしょう：適量
★調味料
しょうゆ：大さじ3
レモン汁：大さじ3
ごま油：大さじ2
砂糖：大さじ1
おろしにんにく：適量
唐辛子（輪切り）：適量

（作り方）
1.セロリを斜め薄切り(葉の部分はとっておく)、きゅうりは千切りにして、塩をふり、水気を切る。
玉ねぎは薄切りにして水にさらし、塩をふり、水気を切る。。
2.鍋に湯をわかし、えびを1分程度ゆで、器にとり、同じ鍋で春雨を表記の時間ゆで、食べやすい大きさに切り、水気を切る
3.フライパンにごま油をひき、おろしにんにく、おろししょうが、豚ひき肉を入れ、肉の色が変わるまで炒め、
塩こしょうを加える。豚肉は器にとり粗熱をとる
4.ボウルに★の調味料を入れ、混ぜて、春雨、豚ひき肉、えび、野菜を入れ、よく混ぜる(お好みで半分に切ったミニトマト、セロリの葉を飾る)")


# 夜食
Menu.create!(customer_id: 1,image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/okonomiyaki.jpg"), filename:"okonomiyaki"),food_status: 2, genre_id: 1, name:"オートミールのお好み焼き", syusyoku:"ご飯", syusai:"お好み焼き", fukusai:"なし",
introduction:"（材料）
オートミール：30g
水：90ml
卵：1個
山芋(とろろにする)：50g(程度)
竹輪：2本
キャベツ：4分の1程度
ネギ(お好み)：1~2本
出汁(家で使ってるものでOK)：適量
鰹節：適量
オタフクソース：適量
マヨネーズ：適量

（作り方）
1.オートミールと水と出汁を混ぜて電子レンジで1分半～2分半程度加熱。
2.加熱したオートミールを少しほぐし、溶き卵、長芋とろろの順で混ぜながら順番に加え馴染ませる。
3.キャベツはざく切り、ネギは小口切り、竹輪は輪切りにし、②に入れ、持ち上げるように混ぜる。
4.フライパンで両面を蒸し焼きにする。ひっくり返すのは少し難しいですが、形が崩れてもヘラなどでなおしてください。
5.お好みで、オタフクソース、マヨネーズ、鰹節をトッピングする。")

Menu.create!(customer_id: 1,image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/beef.jpg"), filename:"beef"),food_status: 2, genre_id: 2, name:"厚切りビーフとポテトの盛り合わせ", syusyoku:"ご飯もしくはパン", syusai:"ビーフ", fukusai:"ポテト",
introduction:"（材料）
「ビーフ」
牛サーロインステーキ（1.5cm厚）：1枚（250g）
塩：小さじ1/2
サラダ油：小さじ2
にんにく（3mmの薄切り）：1かけ分
「ポテト」
冷凍ポテト:必要量
オリーブオイル:回し掛け分
塩、ハーブｍガーリックなど:適量

（作り方）
「ビーフ」
1.牛肉は20分室温に置き、塩をふり、油（小さじ2）をからめ、片面にこしょうをふる。
2.予熱したグリルプレートに油を薄く塗り、こしょうをふった面が下になるよう②をのせ、上ににんにく、タイムをのせ3分焼く。
3.2を取り出し、ホイルで包み休ませる。
4.ペーパータオル等で油をふき取ったプレートに薄く油を塗
「ポテト」
1.冷凍のポテトを必要なだけ、しっかり解凍します。（レンジで温まる程度にチンでもOK.）
2.全体にまぶすことができる程度のオリーブオイルを回しかけ、混ぜます。
3.オーブントースターで、こんがりするまで焼きます。　途中でフライ返しでひっくり返すように混ぜます。
4.最後の５分程度は、蒸気が逃れるように、トースターのドアに串を挟んで隙間をつくることで、カリカリに仕上がります。")


Menu.create!(customer_id: 1,image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/lurohan.jpg"), filename:"lurohan"),food_status: 2, genre_id: 3, name:"ルーロー飯", syusyoku:"ルーロー飯", syusai:"大根スープ", fukusai:"なし",
introduction:"（材料）
豚バラブロック：600g
●水：400cc
●おかず醤油糀：大さじ3
●料理酒：大さじ3
●はちみつ：大さじ3
●オイスターソース：大さじ1
●すりおろしにんにく：小さじ1
●すりおろししょうが：小さじ1
●酢：小さじ2
●八角：1/2個
フライドオニオン：大さじ2
五香粉：少々
ご飯：適量
ゆで卵：3〜4個
高菜漬け：適量
サラダ油：適量
「大根スープ」
大根：適量
生姜：1片
水：600cc
酒：大さじ１
塩：小さじ１
アサツキ：少々

（作り方）
1.豚バラ肉を1cmの棒状に切る。
2.フライパンにサラダ油を入れて豚肉を軽く焼き色がつくまで焼く。
3.●を加えて蓋をして中火で15分煮込む。途中、灰汁が出たら取り除く。
4.フライドオニオン、五香粉を加えて煮汁が少なくなるまで煮込む。
5.ご飯を器に盛り、肉、高菜漬け、半分に切った卵を乗せる。(時間がある場合は卵を煮汁に漬けておくと味が染みる。)
「大根スープ」
1.水の中ない大根を入れ煮込む
2.沸騰したら酒、塩を入れる。
3.アサツキをお好みで入れる")

Menu.create!(customer_id: 1,image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gapao-rice.jpg"), filename:"gapao-rice"),food_status: 2, genre_id: 4, name:"ガパオライス", syusyoku:"ガパオライス", syusai:"なし", fukusai:"なし",
introduction:"（材料）
ごはん：お茶碗2杯(300g)
豚ひき肉：200g
卵：2個
玉ねぎ：1/4個
ピーマン：1個
赤パプリカ：1/2個
バジル；12枚
にんにく：1かけ
サラダ油(目玉焼き用)：大さじ1/2
サラダ油：大さじ1
唐辛子(輪切り)：適量
塩こしょう：少々
☆調味料
ナンプラー：小さじ2
オイスターソース：大さじ1
しょうゆ：小さじ1
砂糖：小さじ1/2

（作り方）
1.玉ねぎ、にんにくはみじん切りにする。ピーマン、赤パプリカは種を取り、小さめの角切りにする。バジルは適当な大きさにちぎる。
2.フライパンにサラダ油(大さじ1/2)を入れて中火で熱し、卵を割り入れ、好みの固さの目玉焼きを作り、取り出す。
3.フライパンにサラダ油(大さじ1)、にんにくを入れて中火で熱し、香りが立ったら豚ひき肉を加えてほぐしながら色が変わるまで炒める。
4.玉ねぎ、ピーマン、赤パプリカを加えて火が通るまで炒める。☆、唐辛子、バジルを加えて、水気が少し残る程度まで炒め合わせる。
器にごはんを盛り、炒めた具材、目玉焼きをのせて塩こしょうをふる。")


