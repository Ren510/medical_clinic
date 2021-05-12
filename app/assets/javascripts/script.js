// スライドショーについての記述
//$(function() {
$(document).on('turbolinks:load', function() {

  // オプションを指定してSkipprの実行
  $(".theTarget").skippr({
    // スライドショーの変化（"fade" or "slide"）
    transition : 'fade',
    // 変化にかかる時間（ミリ秒）
    speed : 1000,
    // easingの種類
    easing : 'easeOutQuart',
    // ナビゲーションの形（"block" or "bubble"）
    navType : 'block',
    // 子要素の種類（"div" or "img"）
    childrenElementType : 'div',
    // ナビゲーション矢印の表示（trueで表示）
    arrows : true,
    // スライドショーの自動再生（falseで自動再生なし）
    autoPlay : true,
    // 自動再生時のスライド切替間隔（ミリ秒）
    autoPlayDuration : 5000,
    // キーボードの矢印キーによるスライド送りの設定（trueで有効）
    keyboardOnAlways : true,
    // 1枚目のスライド表示時に戻る矢印を表示するかどうか [false]:矢印を隠さない [true]:矢印を隠す
    hidePrevious : false
  });


// トップに戻るを実装
    var topBtn = $('#top-btn a');
    topBtn.hide();
    $(window).scroll(function(){
         if ($(this).scrollTop() > 100) {
             topBtn.fadeIn(1000);
         } else {
             topBtn.fadeOut();
         }
    });
    topBtn.click(function () {
        $('body, html').animate({
      scrollTop:0
    }, 1000);
    event.preventDefault();
    });

// 移動について
// うつ病までの移動
    $('#btn1').click(function() {
        var element = document.getElementById('target1'); // 移動させたい位置の要素を取得
        var rect = element.getBoundingClientRect();
        var position = rect.top;    // 一番上からの位置を取得
        scrollTo(0, position);
    });

// 睡眠障害(不眠症)までの移動
    $('#btn2').click(function() {
        var element = document.getElementById('target2'); // 移動させたい位置の要素を取得
        var rect = element.getBoundingClientRect();
        var position = rect.top;    // 一番上からの位置を取得
        scrollTo(0, position);
    });

// 適応障害までの移動
    $('#btn3').click(function() {
        var element = document.getElementById('target3'); // 移動させたい位置の要素を取得
        var rect = element.getBoundingClientRect();
        var position = rect.top;    // 一番上からの位置を取得
        scrollTo(0, position);
    });

// 認知症までの移動
    $('#btn4').click(function() {
        var element = document.getElementById('target4'); // 移動させたい位置の要素を取得
        var rect = element.getBoundingClientRect();
        var position = rect.top;    // 一番上からの位置を取得
        scrollTo(0, position);
    });
});