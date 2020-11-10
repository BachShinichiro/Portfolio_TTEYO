// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery/dist/jquery.js
//= require bootstrap/dist/js/bootstrap.min

//= require_tree .



$(function(){
  function buildField(index) {  // 追加するフォームのｈｔｍｌを用意
    const html = `<div class="js-file-group" data-index="${index}">
                    <div class="tag-area__title">
                      タグ
                    </div>
                    <div class="tag-area__form">
                      <label for="event_select_dates_attributes_${index}_event_date">Event date</label>
                      <input type="datetime-local" name="event[select_dates_attributes][${index}][event_date]" id="event_select_dates_attributes_${index}_event_date">
                      <span class="delete-form-btn">
                        削除する
                      </span>
                    </div>
                  </div>`;
    return html;
  }

  let fileIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] // 追加するフォームのインデックス番号を用意
  var lastIndex = $(".js-file-group:last").data("index"); // 編集フォーム用（すでにデータがある分のインデックス番号が何か取得しておく）
  fileIndex.splice(0, lastIndex); // 編集フォーム用（データがある分のインデックスをfileIndexから除いておく）
  let fileCount = $(".hidden-destroy").length; // 編集フォーム用（データがある分のフォームの数を取得する）
  let displayCount = $(".js-file-group").length // 見えているフォームの数を取得する
  $(".hidden-destroy").hide(); // 編集フォーム用（削除用のチェックボックスを非表示にしておく）
  if (fileIndex.length == 0) $(".add-form-btn").css("display","none"); // 編集フォーム用（フォームが５つある場合は追加ボタンを非表示にしておく）

  $(".add-form-btn").on("click", function(event) { // 追加ボタンクリックでイベント発火
    event.preventDefault();
    $(".tag-area").append(buildField(fileIndex[0])); // fileIndexの一番小さい数字をインデックス番号に使ってフォームを作成
    fileIndex.shift(); // fileIndexの一番小さい数字を取り除く
    if (fileIndex.length == 0) $(".add-form-btn").css("display","none"); // フォームが５つになったら追加ボタンを非表示にする
    displayCount += 1; // 見えているフォームの数をカウントアップしておく
  })

  $(".tag-area").on("click", ".delete-form-btn", function() { // 削除ボタンクリックでイベント発火
    $(".add-form-btn").css("display","block"); // どの道フォームは一つ消えるので、追加ボタンを必ず表示させるようにしておく
    const targetIndex = $(this).parent().parent().data("index") // クリックした箇所のインデックス番号を取得
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`); // 編集用（クリックした箇所のチェックボックスを取得）
    var lastIndex = $(".js-file-group:last").data("index"); // フォームの最後に使われているインデックス番号を取得
    displayCount -= 1; // 表示されているフォーム数を一つカウントダウン
    if (targetIndex < fileCount) { // 編集用（チェックボックスがある場合の処理）
      $(this).parent().parent().css("display","none") // フォームを非表示にする
      hiddenCheck.prop("checked", true); // チェックボックスにチェックを入れる
    } else { // チェックボックスがない場合の処理
      $(this).parent().parent().remove(); // フォームを削除する
    }
    // ↓はfileIndex（フォーム追加ように用意してある数字の配列）の処理
    if (fileIndex.length >= 1) { // 数字が一つでも残っている場合
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1); // 配列の一番右側にある数字に１を足した数字を追加
    } else {
      fileIndex.push(lastIndex + 1); // フォームの最後の数字に1を足した数字を追加
    }
    // ↓はフォームがなくならないための処理
    if (displayCount == 0) { // 見えてるフォームの数が0になったとき
      $(".tag-area").append(buildField(fileIndex[0] - 1)); // fileIndexの一番左側にある数字から１引いた数字でフォームを作成
      fileIndex.shift(); // fileIndexの一番小さい数字を取り除く
      displayCount += 1; // 見えているフォームの数をカウントアップしておく
    }
  })
})


