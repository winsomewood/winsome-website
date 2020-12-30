class CreateDatabase < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :itemno
      t.boolean :kit
      t.string :upc
      t.string :collection
      t.string :description
      t.string :category
      t.string :finish
      t.string :material
      t.boolean :assembly
      t.string :length
      t.string :width
      t.string :height

      t.timestamps
    end

    create_table :kits do |t|
      t.integer :kitno
      t.integer :itemno
      t.string :name

      t.timestamps
    end

    create_table :pages do |t|
      t.string :title
      t.string :slug
      t.text :content

      t.timestamps
    end

    30.times do
      Item.create(itemno: 94504, kit: true, upc: "021713945044", collection: "Pauline", description: "Pauline 5-PC Set Table With Chairs", category: "Dining", finish: "Walnut", material: "Solid Wood", assembly: true, length: "0", width: "0", height: "0")
    end
    Item.create(itemno: 10633, kit: false, upc: "021713106339", collection: "Halifax", description: "Halifax Cabinet", category: "Storage and Organization", finish: "White", material: "Composite Wood", assembly: true, length: "30.71", width: "15.98", height: "26.30")
    Item.create(itemno: 40643, kit: false, upc: "021713406439", collection: "Xola", description: "Xola TV Stand", category: "Media and Entertainment", finish: "Cappuccino", material: "Solid / Composite Wood", assembly: true, length: "44.02", width: "15.94", height: "24.02")
    Item.create(itemno: 40538, kit: false, upc: "021713405388", collection: "Xola", description: "Xola Coffee Table with 2 Drawers", category: "Occasional Table", finish: "Cappuccino", material: "Solid / Composite Wood", assembly: true, length: "37", width: "21", height: "18")

    Kit.create(kitno: 94504, itemno: 94209, name: "Chairs")
    Kit.create(kitno: 94504, itemno: 94044, name: "Table")

    Page.create(
      title: "front_page", slug: "front_page", content: "%h1{:style => \"display: inline\"}\r\n  Welcome\r\n\r\n%p\r\n  This content is generated from the db and was snapshotted in Dec 2020. We are a manufacturer and distributor of quality lifestyle furniture for the home.\r\n  = view_context.link_to(\"View our products\", select_category_path)\r\n\r\n.carousel\r\n  - [\"Kenner\", \"Burke\", \"Delta\", \"Orleans\", \"Richmond\", \"Taylor\"].each do |image|\r\n    = view_context.link_to(view_context.image_tag(\"/images/collections/\#{image}.jpg\"), select_category_path)\r\n\r\n%h1 About Us\r\n\r\n%p\r\n  Winsome began manufacturing and distributing solid wood housewares in 1977, and today it is one of the leading brands of lifestyle furniture known for offering innovative designs with unbeatable balance between craftsmanship and affordability. Our main USA office, assembly operation and distribution warehouse are all efficiently located under one 200,000 square foot facility in Woodinville, Washington while our Canadian branch office and warehouse is situated in Delta, British Columbia.\r\n\r\n%p\r\n  While Winsome offers its own designs of products, we also have a flexibility to customize customers' own designs. And with our centralized, leading-edge operation, our customers enjoy added benefits of order flexibility, fast shipping and quick response from our customer service.\r\n\r\n%p\r\n  Having consistently earned awards and recognitions for innovative leadership, superior business practices and commitment to customers from leading retailers such as Target Corporation and the like, we continue to be committed in bringing products with the best value and service to our customers.\r\n"
    )
    Page.create(
      title: "find", slug: "find", content: "This content is generated from the db and was snapshotted in Dec 2020.\r\n- @page_title = \"Find Us\"\r\n\r\n%p\r\n  Winsome is a furniture wholesaler, and we do not sell our products directly to the public. Our products are available from our many retail partners. If you wish to make a purchase, please contact the retailers directly.\r\n\r\n:ruby\r\n  retailers = [{\r\n    name: \"123Stores\",\r\n    src: \"123Stores.gif\",\r\n    url: \"http://123stores.com/shopby?brand=959\",\r\n  }, {\r\n    name: \"allmodern\",\r\n    src: \"allmodern.gif\",\r\n    url: \"https://www.allmodern.com/Winsome-C534221.html?rtype=9&redir=winsome\",\r\n  }, {\r\n    name: \"amazon\",\r\n    src: \"amazon.gif\",\r\n    url:\r\n     \"http://www.amazon.com/s/ref=bl_sr_home-garden?ie=UTF8&field-brandtextbin=Winsome+Wood&node=1055398\",\r\n  }, {\r\n    name: \"appliancesconnection\",\r\n    src: \"appliancesconnection.gif\",\r\n    url:\r\n     \"https://www.appliancesconnection.com/winsome.html\",\r\n  }, {\r\n    name: \"atgstores\",\r\n    src: \"atgstores.gif\",\r\n    url: \"https://www.atgstores.com/search/Winsome.html?iterm=Winsome&sort=newest\",\r\n  }, {\r\n    name: \"bedbathandbeyond\",\r\n    src: \"bedbathandbeyond.gif\",\r\n    url: \"https://www.bedbathandbeyond.com/store/brand/winsome-trading/1485/1-82?pagSortOpt=DEFAULT-0&view=grid&_requestid=363553\",\r\n  }, {\r\n    name: \"bellacor\",\r\n    src: \"bellacor.gif\",\r\n    url: \"http://www.bellacor.com/results.cfm?Erp=96&Ns=P_hvhmIndex&Hs=1&Nso=0&Ntt=Winsome\",\r\n  },  {\r\n    name: \"bisonoffice\",\r\n    src: \"BisonOffice-LOGO.jpg\",\r\n    url: \"https://www.bisonoffice.com/brand/3625\",\r\n  }, {\r\n    name: \"bizchair\",\r\n    src: \"bizchair.png\",\r\n    url: \"http://search.bizchair.com/search#?p=Q&lbc=bizchair&uid=386518784&ts=ajax&w=winsome&method=and&view=grid&cnt=300&af=&isort=sortrating\",\r\n  }, {\r\n    name: \"brookstone\",\r\n    src: \"brookstone.gif\",\r\n    url: \"http://www.brookstone.com/search?q=winsome\",\r\n  },{\r\n    name: \"clickhere2shop\",\r\n    src: \"Clickhere2shop.gif\",\r\n    url: \"http://www.clickhere2shop.com/search.php?q=winsome\",\r\n  }, {\r\n    name: \"costuless\",\r\n    src: \"costuless.gif\",\r\n    url: \"http://www.costuless.com/\",\r\n  }, {\r\n    name: \"Cymax\",\r\n    src: \"cymax.gif\",\r\n    url: \"https://www.cymax.com/Winsome--B60.htm\",\r\n  }, {\r\n    name: \"goedekers\",\r\n    src: \"Goedekers.gif\",\r\n    url: \"https://www.goedekers.com/catalogsearch/result/?q=winsome&form_key=dDizynDmybNAkCNf\",\r\n  }, {\r\n    name: \"fredmeyer\",\r\n    src: \"fredmeyer.gif\",\r\n    url: \"https://www.fredmeyer.com/searching?query=Winsome#?query=Winsome&facet=Products&page=1\",\r\n  }, {\r\n    name: \"hayneedle\",\r\n    src: \"hayneedle.jpg\",\r\n    url: \"http://www.hayneedle.com/brands/winsome/list\",\r\n  },  {\r\n    name: \"Homeshoppingmall\",\r\n    src: \"Homeshoppingmall.gif\",\r\n    url: \"https://www.homeshoppingmalls.com/brand/winsome-wood\",\r\n  }, {\r\n    name: \"Houzz\",\r\n    src: \"Houzz.gif\",\r\n    url: \"http://www.houzz.com/pro/winsomewood\",\r\n  }, {\r\n    name: \"Kohls\",\r\n    src: \"Kohls.gif\",\r\n    url: \"https://www.kohls.com/search.jsp?search=Winsome&submit-search=web-regular\",\r\n  }, {\r\n    name: \"lowes-logo\",\r\n    src: \"lowes-logo.jpg\",\r\n    url: \"http://www.lowes.ca/winsome-wood_m2278.html\",\r\n  }, {\r\n    name: \"Michaelcfina\",\r\n    src: \"Michaelcfina.gif\",\r\n    url: \"https://www.michaelcfina.com\",\r\n  }, {\r\n    name: \"nfm\",\r\n    src: \"nfm.gif\",\r\n    url: \"https://www.nfm.com/list.aspx?dsNav=Ntk:primary|Winsome+Trading|3|,Ro:0,Ns:p_is_bestseller|101|-1|&dsDS=D:Winsome+Trading&dsCDS=D:Winsome+Trading&fromsearch=true&q=Winsome+Trading\",\r\n  }, {\r\n    name: \"ojcommerce\",\r\n    src: \"ojcommerce.gif\",\r\n    url: \"http://www.ojcommerce.com/search?k=Winsome&brand_id=3101%7C4585&sort=1\",\r\n  }, {\r\n    name: \"opentip\",\r\n    src: \"opentip.gif\",\r\n    url: \"https://www.opentip.com/brand/Winsome-7659.html?page=1\",\r\n  }, {\r\n    name: \"organizeit\",\r\n    src: \"organizeit.gif\",\r\n    url: \"http://search.organizeit.com/search?site=organizesit#?p=Q&lbc=organizesit&uid=391872938&ts=ajax&w=Winsome&isort=score&method=and&view=grid&af=&site=organizesit&filter=type%3aproduct&cnt=300\",\r\n  },{\r\n    name: \"quill\",\r\n    src: \"quill.gif\",\r\n    url:\r\n     \"http://www.quill.com/search?x=0&y=0&keywords=Winsome&ajx=1\",\r\n  }, {\r\n    name: \"shopko\",\r\n    src: \"Shopko.gif\",\r\n    url: \"http://www.shopko.com/catalog/search.cmd?form_state=noResultssearchForm&keyword=Winsome\",\r\n  }, {\r\n    name: \"shopladder\",\r\n    src: \"shopladder.gif\",\r\n    url: \"http://www.shopladder.com/Winsome Wood-BR334.htm\",\r\n  }, {\r\n    name: \"stage\",\r\n    src: \"Stage.jpg\",\r\n    url: \"http://www.stage.com/c/winsome/N-0Z1qsesw1/?Ns=product.firstReceiptDate%7C1\",\r\n  }, {\r\n    name: \"staples\",\r\n    src: \"staples.gif\",\r\n    url: \"http://www.staples.com/winsome/directory_winsome?fids=&sr=true&sby=6&min=&max=\",\r\n  }, {\r\n    name: \"target\",\r\n    src: \"target.jpg\",\r\n    url: \"http://www.target.com/\",\r\n  }, {\r\n    name: \"Totallyfurniture\",\r\n    src: \"Totallyfurniture.gif\",\r\n    url: \"https://www.totallyfurniture.com/brand/winsome-wood\",\r\n  },  {\r\n    name: \"Theshoppingchannel\",\r\n    src: \"TSC.png\",\r\n    url: \"https://www.theshoppingchannel.com/search/Winsome%20furniture?nav=n:0\",\r\n  }, {\r\n    name: \"Unbeatablesale\",\r\n    src: \"Unbeatablesale.jpg\",\r\n    url: \"http://search1.unbeatablesale.com/?Nty=1&D=Winsome&vno=96&Dk=0&N=0&Ntt=Winsome\",\r\n  }, {\r\n    name: \"Vermontcountrystore\",\r\n    src: \"Vermontcountrystore.gif\",\r\n    url: \"https://www.vermontcountrystore.com/home/category/furniture\",\r\n  }, {\r\n    name: \"virventures\",\r\n    src: \"virventures-logo.gif\",\r\n    url: \"http://virventures.com/index.php?route=product/search&filter_name=WINS-\",\r\n  }, {\r\n    name: \"walmart\",\r\n    src: \"walmart.gif\",\r\n    url: \"https://www.walmart.com/search/?facet=brand%3AWinsome&page=1&query=winsome+furniture&sort=rating_high&typeahead=winsome#searchProductResult\",\r\n  }, {\r\n    name: \"walmart_CA\",\r\n    src: \"walmart_CA.gif\",\r\n    url: \"https://www.walmart.ca/en/furniture/winsome/N-119+1019740/page-1?sortBy=newest&orderBy=ASC\",\r\n  }, {\r\n    name: \"wayfair\",\r\n    src: \"wayfair.gif\",\r\n    url: \"http://www.wayfair.com/Winsome-C115456.html\",\r\n  }, {\r\n    name: \"wayfair_CA\",\r\n    src: \"Wayfair-CA.gif\",\r\n    url: \"https://www.wayfair.ca/Winsome-B225.html\",\r\n  }, {\r\n    name: \"Zulily\",\r\n    src: \"zulily.gif\",\r\n    url: \"https://www.zulily.com\",\r\n  }]\r\n\r\n%ul#find\r\n  - retailers.each do |retailer|\r\n    %li\r\n      %a{:href => retailer[:url], :target => \"_blank\"}\r\n        = view_context.image_tag(\"/images/companies/\#{retailer[:src]}\", :alt => retailer[:name])\r\n"
    )
    Page.create(
      title: "success", slug: "success", content: "This content is generated from the db and was snapshotted in Dec 2020.\r\n- @page_title = \"Thank you!\"\r\n\r\n%p You will hear back from us soon.\r\n\r\n%p= view_context.link_to(\"Back to Contact Us\", contact_path)\r\n"
    )
    Page.create(
      title: "handle_404", slug: "handle_404", content: "This content is generated from the db and was snapshotted in Dec 2020. The page you were looking for could not be found. <a href=\"/\">Return to the home page</a>."
    )
  end
end
