# -------------------------------------
# hmModalSet.tcl
# 模态分析设置
# -------------------------------------

# 删除原有卡片\载荷\工况
hm_blockerrormessages 1
*createmark card 1 all
catch {*deletemark card 1}
*createmark loadcols 1 all
catch {*deletemark loadcols 1}
*createmark loadstep 1 all
catch {*deletemark loadstep 1}
hm_blockerrormessages 0

# 当前文件路径
set filepath [file dirname [info script]]

# EIGRL
*collectorcreate loadcols "EIGRL_1" "" 11
*createmark loadcols 1  "EIGRL_1"
*dictionaryload loadcols 1 [format "%s/sets/optistruct" $filepath] "EIGRL"
*attributeupdateint loadcols 1 3240 1 2 0 1
*attributeupdatedouble loadcols 1 802 1 0 0 0
*attributeupdatedouble loadcols 1 803 1 0 0 0
# 模态设置 10阶
*attributeupdateint loadcols 1 804 1 1 0 10
*attributeupdateint loadcols 1 805 1 0 0 1
*attributeupdateint loadcols 1 806 1 0 0 7
*attributeupdatedouble loadcols 1 807 1 0 0 0
*attributeupdatestring loadcols 1 808 1 2 0 "MASS"


# loadstep
*createmark loadcols 1  "EIGRL_1"
*createmark outputblocks 1
*createmark groups 1
*loadstepscreate "normal_modes" 1
*attributeupdateint loadsteps 1 4143 1 1 0 1
*attributeupdateint loadsteps 1 4709 1 1 0 3
*attributeupdateentity loadsteps 1 4966 1 1 0 loadcols 1
*attributeupdateint loadsteps 1 3800 1 1 0 0
*attributeupdateint loadsteps 1 707 1 1 0 0
*attributeupdateint loadsteps 1 2396 1 1 0 0
*attributeupdateint loadsteps 1 8134 1 1 0 0
*attributeupdateint loadsteps 1 2160 1 1 0 0




