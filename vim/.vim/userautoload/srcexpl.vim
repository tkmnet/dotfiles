NeoBundleLazy "wesleyche/SrcExpl", {
      \ "autoload" : { "commands": ["SrcExplToggle"]}}
if ! empty(neobundle#get("SrcExpl"))
  " Set refresh time in ms
  let g:SrcExpl_RefreshTime = 1000
  " Is update tags when SrcExpl is opened
  let g:SrcExpl_isUpdateTags = 0
  " Tag update command
  let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase %'
  " Update all tags
  function! g:SrcExpl_UpdateAllTags()
    let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase -R .'
    call g:SrcExpl_UpdateTags()
    let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase %'
  endfunction
  " Source Explorer Window Height
  let g:SrcExpl_winHeight = 8
  " Mappings
	nn <silent> <leader>e :SrcExplToggle<CR>
  nn [srce] <Nop>
  nm <Leader>E [srce]
  nn <silent> [srce]u :call g:SrcExpl_UpdateTags()<CR>
  nn <silent> [srce]a :call g:SrcExpl_UpdateAllTags()<CR>
  nn <silent> [srce]n :call g:SrcExpl_NextDef()<CR>
  nn <silent> [srce]p :call g:SrcExpl_PrevDef()<CR>
endif
