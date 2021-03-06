namespace :cleanup do
  desc 'Delete free sites with ≤ 1 block'
  task :sites => :environment do
    Site.joins(:blocks)
      .select { |site| site.blocks.size <= 1 && site.owner.plan == Plan.free }
      .each { |s| s.owner.destroy }
  end

  desc 'Delete dormant sites'
  task :dormant => :environment do
    %w(
    robles
    altagracia
    cartografias-apocrifas
    get-digi-thinking
    montevideo
    jobguru
    conveniencies
    mjtaylor
    tracegenie
    tomasesteban
    radiodocebeijo
    raul
    learnbhasha
    educationalsite
    palash
    moonshapedpostcards
    los-championes
    pasta-laser
    bisnis-online
    testerfirstapp
    kappelou
    lorris
    quebranza
    luce
    oliviertripet
    lolomongpogi
    raul160
    pokus
    intech-designer
    fitbus
    macaronny
    taken-list
    reviresco-assisting
    amirs-site
    lia
    ck-studios
    settlephy
    mail-mail
    spotcam
    acemedia
    seohelpformywebsite-com
    luigis-pizza
    raul161
    bizkidz-private-security-firm
    jobjimbo
    gnarly
    customer
    arthu
    dondivanails
    all-classics
    ali
    nik-graf
    andrew-zell
    jschuur
    andrew
    adin
    vlad
    comaker
    arunkumar
    jason
    zaf
    stevenbell-xyz
    alexeisholik
    bel-air-inc
    crossheart
    aramx
    the-minimalist
    christoffer
    apas
    ozgrozer
    iprimamedia
    aarthi
    portugalasaservice
    luca-pammolli
    goncalorodrigues
    asdkj
    sw
    liang
    cathal
    ku
    laoyapi
    mdemers
    webonise
    thanasis
    filippo-mursia
    etienne
    mightymango
    purplebat
    launchaco
    adamisntdead
    hostesperto
    sysrqer
    maxgoldhouse
    jake
    dancatchpole
    www-radlawgroup-com
    andrewowest
    ting-yu-lin
    johnzhang
    ecommerce-holiday
    moyome
    thilak
    mahantesh19
    david
    christian
    ux-hacker
    jeroen
    maeda
    filipjohansen
    me
    naveennaidu
    keek
    sitos
    mhenry
    http-my-site-upsite-io
    kimtoma
    josekalladanthyil
    redkill2108
    dkunin
    nblackburn
    saurav
    azernyc
    niklas-olaisson
    asgard
    simeonduke
    santomegonzalo
    rkkautsar
    tippecanoe
    cole-ellison
    alan
    parkeragee
    michaelparr
    louislouis
    lovesally105
    reza
    joern
    monkey
    minwoo
    david-chie
    andreascarpello
    pradeep
    slita
    andythc
    onfocus
    ageno
    elpinchetierno
    night38107
    lkjiaherek
    toglendinningandbeyond
    mats-hartvig-abrahamsen
    campingdonuts
    thomaspetitjean
    ascccwc
    markman
    galas
    nessimzouaoui
    deldan
    betafrozzio
    rafael-weiblen
    testing434
    rob-valentine
    zats-me
    rubeng
    pamo
    amin
    test1133
    adrianoarruda
    choufeng
    buscagro-co
    andy
    testserhad
    scott
    chepe
    valentinrodriguez
    mrguyshimoni
    travelleads
    grabault
    testing-bradroberts
    cam
    diaryofawanderlust
    pazarando
    echc
    fuckyouasshole
    diane-huang
    james-selby
    damian
    reillysweetland
    pediki
    sean-washington
    dhaya
    dean
    mangata
    guzouzhe
    1ancespace
    j
    art2713
    kaitech
    abhishek
    sanjeev
    autumn
    milkywaynian
    lunamoth
    luismendozamx
    maylover1117
    abc
    ninos-fosforescentes96
    forex
    rmateu
    alkolsuzistanbul
    aaronmcelweedesign
    unreasonable-advice
    sebasing
    timeji
    msk
    zoeleblanc
    kleerkoat
    ericeric
    http-bakk-in
    tomasgauthier
    boetter
    bnb
    propane-refill-services
    yicheng-zhang
    yoann-grange
    fgfdgdfgfdg
    phil
    rosey
    moped-city
    jordan
    autnow
    bloggingdimes
    mph
    willwright
    kra
    omarsoler
    gesvi
    ohmega
    greg
    cristiano
    johannesippen
    vladgozman
    kurtiverson
    gzztz
    stewalexander
    xen
    aycovandermeer
    will
    blah
    adamnac
    cs
    ryan
    funkydisco
    edip
    sbdjajzsdfhlvsaludvlusdv
    excellent-india-logistics
    appinn
    dun
    scratchtheatre
    ruckert
    josh
    hungryfolks
    marat-stary
    jithin-rajiv
    skaut-spa
    jackdearlove-co-uk
    xiaowei2479
    utahscooter
    brendan
    manuel
    lifehacky
    nhau
    edvin
    sukhpreet-kalra
    phill
    maximz
    vinceluo
    drobles
    vpninja
    ascend-group
    timetospare
    sevketarslan
    springfield
    alexivanov
    wasabi
    roots
    cloud-angel-fund
    nem-ekpunobi
    marky
    y
    elfyu
    robinwen
    liangjian
    bowerbird
    foryournails
    ecruz
    helme
    olifrost
    julien
    danielhughes
    mywizz
    tellyourmummy
    alex
    mike-murphu
    gates
    mike-murphy
    alan391
    my-site
    land-book
    andrezgz
    tarbib
    kbtc
    elvis
    tolu-olubode
    tiavita
    marloxo
    leio
    ignotum
    airlinecrewlayover
    theconcept
    http-happilyadopt-com
    andywinecki
    villmoa
    liverowing
    sdomomoo
    www-laencanterie-com
    sumit
    i9finite
    clomads
    ponceduron
    estudioveo
    wael
    yanming
    plmd
    one
    zhenyong
    ambize
    winter1ife
    sebasbad
    ronilan
    minghigh
    intuit
    nels
    giantrobot
    active-employ
    pappweb
    boetie
    jason507
    empower
    zuoxue
    neil
    abhinawkumar
    ravikiran
    taishi
    graphitivity
    justinbibi
    undermarketing-co
    kabir
    deneme
    filege
    geet
    olivm
    mehdi
    bushelee
    matticus
    tailchaser
    bewaves
    wetell-media
    mahir
    eekay
    opp
    ak47
    maria-pastry-apprentice
    harshit
    jaquelinilb
    intranet-hogares-union
    x
    z
    nimit
    jason496
    yatima
    teachmob
    joshbruni
    t3gn-solution
    evago
    deizel
    watterfall
    josh583
    maxxi
    emil-song
    seekseep
    free-spirit-life-coaching
    farmer
    ankitgupta
    hilaundry
    skintfood
    che
    varun
    spaceshiplibrary
    ucai
    joecohens
    victor-motricala
    coverr
    sg
    gugu
    jarjan
    mvrht
    eswar
    likexin
    arti1-com
    martinpagac
    drane
    suumpro
    dealin
    intelligentpower
    seo
    mxkwang
    999999999
    contrxst
    hemajessie
    nader-awad
    matthes
    olivejun
    jjtvorg
    liuyujie
    mkt-digital
    poison
    x00002217
    goranko
    mythology12345
    alef
    www-gunnink-nl
    craftbeauty
    k06a
    vojio
    ajduke
    juaniquillo
    echangedemontreal-com
    csah5101124
    joaosilva
    steorfan
    10seconds
    goodbot
    kjkjkjkj
    dan
    ludens
    tombolini
    roy
    sistemasdegestion
    justin
    iranjith4
    dtc
    seo810
    glacial
    tigro
    mysite
    it-center
    delosseeenheid
    forsarang
    erwblo
    tastytoros
    jacobhsu
    wenh
    andy959
    roman
    ashishagarwal
    amansatija
    safehands
    dodongdep
    yong
    vie
    spritle
    bakersbakers
    chingiz
    1070
    kingofcuration
    raleighing
    lapsea
    martin636
    svetlo
    ken-damato
    borja
    pak
    chipzchipz
    billy
    nuno-eufrasio
    anderson-group
    vizcaino-jimenez
    travis
    http-51minutebooks-com
    honzajura
    hehehai
    urbanorbit
    vale-media
    marketbo
    homoud
    jonthebeef
    omontayo
    gruneg
    mintisan
    thirdtype
    justinoringer
    bin
    leodenale
    uber-conductores
    yfzhe
    jackbarham
    981net
    ari
    mustafa
    1911bar-com
    martijnhoenderop
    wine
    reyesdelpollo
    happy-waffle
    all-things-nice
    englishvocabgame
    juan
    skapamento
    ya
    test-mysite
    casa-bonita
    dayerlin-blanco
    tilmannb
    johnkeith
    bgeseng
    chenwenxin
    cem
    veedee
    zhongkezhiye
    hello
    hu-roger
    a
    groundera
    stingzai
    hosting
    edenn3231
    loong
    dylanliu
    i
    arnaud
    mcgloch
    markus
    tibor
    tranca
    adfsdf
    greiggy
    giovanni-daboin
    dominickchen
    rippl
    srtf
    hungrytroops
    kenanchristian
    mikesten
    pixelrain
    oscar-vargas
    adamas
    vivirand
    joacimnilsson
    nolboo
    atto
    mahfa
    jmjeong
    fahad
    joyce
    novecentoallisola-it
    ashleytqy
    luke
    cjkrueger
    photography
    ryan692
    sinergios-com
    carrotcorp
    fluency03
    bunk
    yesannian
    guy-schmidt
    ideas-target
    r
    sdonews
    kategrix
    maxelman
    moritzbierling
    icysoul
    guojie
    ruta-huasteca
    bryanong
    bimh
    ouhsgn
    l
    eomediard-com
    techcollecto
    heysan
    giomed-sac
    taewan
    open-rants
    duffy
    robotycs
    redes
    andyfang
    jw
    pandaskill
    jimmy-nelson
    ruben
    inesencial
    adamindex
    trai25
    maanit-madan
    white-collar
    secicl
    milly-deluna
    ips
    testering
    bz-group-com
    sheldon
    fair-energy
    nicolas
    rodriguez
    eternauta
    attia
    chinthrajah
    javiersanchez
    chris
    kexrex
    eduardo
    spark
    ruimarinho
    tom-connole
    dongjie
    test1
    mtjh
    tiivik
    leovbranco
    compuolmer
    drew-stuerman
    brandon-gomez
    opn
    washi
    chiklu
    i-iove
    charlestark
    1581052236
    mundoces
    moderntiants
    lanternlin
    yeltsin
    navigationhi
    barffair
    pinyun
    start
    mihai
    itworks
    jluiscastillo
    dgitup
    alexminlee
    max
    gai
    chien
    goodmorning
    chris765
    thyago
    andandorinha
    d-perfume
    emarts
    kwonhyuckmin
    ryan766
    johnpaulada
    mammademin
    themarcma
    gcm
    tg
    cv-erik-reyes
    rickeychoi
    carlos
    eduardourcelay
    seanfan
    xinzhi
    svxn
    geekamatic
    ravisundram
    clickbrain
    embertribe
    orcun
    restaurant
    designco
    sysrqer839
    brian-douglas
    dna
    dki
    ada
    morandom
    zkyw
    ritaenglish
    filwa
    waynesora
    melzpam
    melon
    bagce
    fillusion
    julian-joseph
    https-www-zhihu-com-people-catye777
    mustaphadid
    daniel
    muukii
    joshua
    mikirepo
    1234
    fanfan
    a1038
    signo
    ricky
    larah
    yoonakim
    divaka
    thequackdoctors-site
    labjia
    r2design
    stephaniestills
    jovan
    testingdemo
    wilsontovar
    keterone
    tangphphtography
    titan
    academe
    johnliao
    tests
    jake1072
    ray
    smoketimes
    king-to-golf-club
    marcuskung
    xxaljing
    hunlongyu
    wrkclrt
    irskiy
    ).each do |subdomain|
      if s = Site.find_by(subdomain: subdomain)
        s.owner.destroy
      end
    end
  end
end
