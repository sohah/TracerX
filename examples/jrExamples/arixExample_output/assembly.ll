; ModuleID = '/home/soha/git/tracerXMaster/tracerx/examples/jrExamples/arixExample.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"t\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"t > 0 && x > -1 && x < 2\00", align 1
@.str3 = private unnamed_addr constant [71 x i8] c"/home/soha/git/tracerXMaster/tracerx/examples/jrExamples/arixExample.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"x > -3 && x < 6 && y < z\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"klee_div_zero_check.c\00", align 1
@.str16 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str27 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str38 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str14 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str25 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1
@.str6 = private unnamed_addr constant [13 x i8] c"klee_range.c\00", align 1
@.str17 = private unnamed_addr constant [14 x i8] c"invalid range\00", align 1
@.str28 = private unnamed_addr constant [5 x i8] c"user\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  %t = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %y, align 4, !dbg !128
  store i32 0, i32* %z, align 4, !dbg !129
  %2 = bitcast i32* %x to i8*, !dbg !130
  call void @klee_make_symbolic(i8* %2, i64 4, i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)), !dbg !130
  %3 = bitcast i32* %t to i8*, !dbg !131
  call void @klee_make_symbolic(i8* %3, i64 4, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0)), !dbg !131
  %4 = load i32* %t, align 4, !dbg !132
  %5 = icmp sgt i32 %4, 0, !dbg !132
  br i1 %5, label %6, label %13, !dbg !132

; <label>:6                                       ; preds = %0
  %7 = load i32* %x, align 4, !dbg !132
  %8 = icmp sgt i32 %7, -1, !dbg !132
  br i1 %8, label %9, label %13, !dbg !132

; <label>:9                                       ; preds = %6
  %10 = load i32* %x, align 4, !dbg !132
  %11 = icmp slt i32 %10, 2, !dbg !132
  br i1 %11, label %12, label %13, !dbg !132

; <label>:12                                      ; preds = %9
  br label %15, !dbg !132

; <label>:13                                      ; preds = %9, %6, %0
  %14 = call i32 (i8*, i8*, i32, i8*, ...)* bitcast (i32 (...)* @__assert_fail to i32 (i8*, i8*, i32, i8*, ...)*)(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([71 x i8]* @.str3, i32 0, i32 0), i32 11, i8* gete
  br label %15, !dbg !132

; <label>:15                                      ; preds = %13, %12
  %16 = load i32* %t, align 4, !dbg !133
  %17 = icmp sgt i32 %16, 1, !dbg !133
  br i1 %17, label %18, label %19, !dbg !133

; <label>:18                                      ; preds = %15
  store i32 0, i32* %y, align 4, !dbg !135
  store i32 1, i32* %z, align 4, !dbg !137
  br label %20, !dbg !138

; <label>:19                                      ; preds = %15
  store i32 1, i32* %y, align 4, !dbg !139
  store i32 2, i32* %z, align 4, !dbg !141
  br label %20

; <label>:20                                      ; preds = %19, %18
  %21 = load i32* %x, align 4, !dbg !142
  %22 = icmp sgt i32 %21, 0, !dbg !142
  br i1 %22, label %23, label %28, !dbg !142

; <label>:23                                      ; preds = %20
  %24 = load i32* %x, align 4, !dbg !144
  %25 = add nsw i32 %24, 1, !dbg !144
  store i32 %25, i32* %x, align 4, !dbg !144
  %26 = load i32* %z, align 4, !dbg !146
  %27 = add nsw i32 %26, 33, !dbg !146
  store i32 %27, i32* %z, align 4, !dbg !146
  br label %36, !dbg !147

; <label>:28                                      ; preds = %20
  %29 = load i32* %x, align 4, !dbg !148
  %30 = add nsw i32 %29, 3, !dbg !148
  store i32 %30, i32* %x, align 4, !dbg !148
  %31 = load i32* %y, align 4, !dbg !150
  %32 = sub nsw i32 0, %31, !dbg !150
  store i32 %32, i32* %y, align 4, !dbg !150
  %33 = load i32* %z, align 4, !dbg !151
  %34 = sub nsw i32 0, %33, !dbg !151
  %35 = add nsw i32 %34, 2, !dbg !151
  store i32 %35, i32* %z, align 4, !dbg !151
  br label %36

; <label>:36                                      ; preds = %28, %23
  %37 = load i32* %x, align 4, !dbg !152
  %38 = icmp sgt i32 %37, -3, !dbg !152
  br i1 %38, label %39, label %47, !dbg !152

; <label>:39                                      ; preds = %36
  %40 = load i32* %x, align 4, !dbg !152
  %41 = icmp slt i32 %40, 6, !dbg !152
  br i1 %41, label %42, label %47, !dbg !152

; <label>:42                                      ; preds = %39
  %43 = load i32* %y, align 4, !dbg !152
  %44 = load i32* %z, align 4, !dbg !152
  %45 = icmp slt i32 %43, %44, !dbg !152
  br i1 %45, label %46, label %47, !dbg !152

; <label>:46                                      ; preds = %42
  br label %49, !dbg !152

; <label>:47                                      ; preds = %42, %39, %36
  %48 = call i32 (i8*, i8*, i32, i8*, ...)* bitcast (i32 (...)* @__assert_fail to i32 (i8*, i8*, i32, i8*, ...)*)(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([71 x i8]* @.str3, i32 0, i32 0), i32 30, i8* gete
  br label %49, !dbg !152

; <label>:49                                      ; preds = %47, %46
  %50 = load i32* %1, !dbg !153
  ret i32 %50, !dbg !153
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noreturn
declare i32 @__assert_fail(...) #3

; Function Attrs: nounwind uwtable
define void @klee_div_zero_check(i64 %z) #4 {
  %1 = icmp eq i64 %z, 0, !dbg !154
  br i1 %1, label %2, label %3, !dbg !154

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str16, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str27, i64 0, i64 0)) #7, !dbg !156
  unreachable, !dbg !156

; <label>:3                                       ; preds = %0
  ret void, !dbg !157
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #5

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @klee_int(i8* %name) #4 {
  %x = alloca i32, align 4
  %1 = bitcast i32* %x to i8*, !dbg !158
  call void @klee_make_symbolic(i8* %1, i64 4, i8* %name) #8, !dbg !158
  %2 = load i32* %x, align 4, !dbg !159, !tbaa !160
  ret i32 %2, !dbg !159
}

; Function Attrs: nounwind uwtable
define void @klee_overshift_check(i64 %bitWidth, i64 %shift) #4 {
  %1 = icmp ult i64 %shift, %bitWidth, !dbg !164
  br i1 %1, label %3, label %2, !dbg !164

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str38, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) #7, !dbg !166
  unreachable, !dbg !166

; <label>:3                                       ; preds = %0
  ret void, !dbg !168
}

; Function Attrs: nounwind uwtable
define i32 @klee_range(i32 %start, i32 %end, i8* %name) #4 {
  %x = alloca i32, align 4
  %1 = icmp slt i32 %start, %end, !dbg !169
  br i1 %1, label %3, label %2, !dbg !169

; <label>:2                                       ; preds = %0
  call void @klee_report_error(i8* getelementptr inbounds ([13 x i8]* @.str6, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) #7, !dbg !171
  unreachable, !dbg !171

; <label>:3                                       ; preds = %0
  %4 = add nsw i32 %start, 1, !dbg !172
  %5 = icmp eq i32 %4, %end, !dbg !172
  br i1 %5, label %21, label %6, !dbg !172

; <label>:6                                       ; preds = %3
  %7 = bitcast i32* %x to i8*, !dbg !174
  call void @klee_make_symbolic(i8* %7, i64 4, i8* %name) #8, !dbg !174
  %8 = icmp eq i32 %start, 0, !dbg !176
  %9 = load i32* %x, align 4, !dbg !178, !tbaa !160
  br i1 %8, label %10, label %13, !dbg !176

; <label>:10                                      ; preds = %6
  %11 = icmp ult i32 %9, %end, !dbg !178
  %12 = zext i1 %11 to i64, !dbg !178
  call void @klee_assume(i64 %12) #8, !dbg !178
  br label %19, !dbg !180

; <label>:13                                      ; preds = %6
  %14 = icmp sge i32 %9, %start, !dbg !181
  %15 = zext i1 %14 to i64, !dbg !181
  call void @klee_assume(i64 %15) #8, !dbg !181
  %16 = load i32* %x, align 4, !dbg !183, !tbaa !160
  %17 = icmp slt i32 %16, %end, !dbg !183
  %18 = zext i1 %17 to i64, !dbg !183
  call void @klee_assume(i64 %18) #8, !dbg !183
  br label %19

; <label>:19                                      ; preds = %13, %10
  %20 = load i32* %x, align 4, !dbg !184, !tbaa !160
  br label %21, !dbg !184

; <label>:21                                      ; preds = %19, %3
  %.0 = phi i32 [ %20, %19 ], [ %start, %3 ]
  ret i32 %.0, !dbg !185
}

declare void @klee_assume(i64) #6

; Function Attrs: nounwind uwtable
define weak i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #4 {
  %1 = icmp eq i64 %len, 0, !dbg !186
  br i1 %1, label %._crit_edge, label %.lr.ph.preheader, !dbg !186

.lr.ph.preheader:                                 ; preds = %0
  %n.vec = and i64 %len, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %2 = add i64 %len, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep4 = getelementptr i8* %srcaddr, i64 %2
  %scevgep = getelementptr i8* %destaddr, i64 %2
  %bound1 = icmp uge i8* %scevgep, %srcaddr
  %bound0 = icmp uge i8* %scevgep4, %destaddr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %srcaddr, i64 %n.vec
  %ptr.ind.end6 = getelementptr i8* %destaddr, i64 %n.vec
  %rev.ind.end = sub i64 %len, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep103 = getelementptr i8* %destaddr, i64 %index
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !187
  %wide.load = load <16 x i8>* %3, align 1, !dbg !187
  %next.gep.sum279 = or i64 %index, 16, !dbg !187
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum279, !dbg !187
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !187
  %wide.load200 = load <16 x i8>* %5, align 1, !dbg !187
  %6 = bitcast i8* %next.gep103 to <16 x i8>*, !dbg !187
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !187
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum279, !dbg !187
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !187
  store <16 x i8> %wide.load200, <16 x i8>* %8, align 1, !dbg !187
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !188

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %srcaddr, %.lr.ph.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val5 = phi i8* [ %destaddr, %.lr.ph.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end6, %vector.body ]
  %resume.val7 = phi i64 [ %len, %.lr.ph.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %src.03 = phi i8* [ %11, %.lr.ph ], [ %resume.val, %middle.block ]
  %dest.02 = phi i8* [ %13, %.lr.ph ], [ %resume.val5, %middle.block ]
  %.01 = phi i64 [ %10, %.lr.ph ], [ %resume.val7, %middle.block ]
  %10 = add i64 %.01, -1, !dbg !186
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !187
  %12 = load i8* %src.03, align 1, !dbg !187, !tbaa !191
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !187
  store i8 %12, i8* %dest.02, align 1, !dbg !187, !tbaa !191
  %14 = icmp eq i64 %10, 0, !dbg !186
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !186, !llvm.loop !192

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  ret i8* %destaddr, !dbg !193
}

; Function Attrs: nounwind uwtable
define weak i8* @memmove(i8* %dst, i8* %src, i64 %count) #4 {
  %1 = icmp eq i8* %src, %dst, !dbg !194
  br i1 %1, label %.loopexit, label %2, !dbg !194

; <label>:2                                       ; preds = %0
  %3 = icmp ugt i8* %src, %dst, !dbg !196
  br i1 %3, label %.preheader, label %18, !dbg !196

.preheader:                                       ; preds = %2
  %4 = icmp eq i64 %count, 0, !dbg !198
  br i1 %4, label %.loopexit, label %.lr.ph.preheader, !dbg !198

.lr.ph.preheader:                                 ; preds = %.preheader
  %n.vec = and i64 %count, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %5 = add i64 %count, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep11 = getelementptr i8* %src, i64 %5
  %scevgep = getelementptr i8* %dst, i64 %5
  %bound1 = icmp uge i8* %scevgep, %src
  %bound0 = icmp uge i8* %scevgep11, %dst
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %src, i64 %n.vec
  %ptr.ind.end13 = getelementptr i8* %dst, i64 %n.vec
  %rev.ind.end = sub i64 %count, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %src, i64 %index
  %next.gep110 = getelementptr i8* %dst, i64 %index
  %6 = bitcast i8* %next.gep to <16 x i8>*, !dbg !198
  %wide.load = load <16 x i8>* %6, align 1, !dbg !198
  %next.gep.sum586 = or i64 %index, 16, !dbg !198
  %7 = getelementptr i8* %src, i64 %next.gep.sum586, !dbg !198
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !198
  %wide.load207 = load <16 x i8>* %8, align 1, !dbg !198
  %9 = bitcast i8* %next.gep110 to <16 x i8>*, !dbg !198
  store <16 x i8> %wide.load, <16 x i8>* %9, align 1, !dbg !198
  %10 = getelementptr i8* %dst, i64 %next.gep.sum586, !dbg !198
  %11 = bitcast i8* %10 to <16 x i8>*, !dbg !198
  store <16 x i8> %wide.load207, <16 x i8>* %11, align 1, !dbg !198
  %index.next = add i64 %index, 32
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !200

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %src, %.lr.ph.preheader ], [ %src, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val12 = phi i8* [ %dst, %.lr.ph.preheader ], [ %dst, %vector.memcheck ], [ %ptr.ind.end13, %vector.body ]
  %resume.val14 = phi i64 [ %count, %.lr.ph.preheader ], [ %count, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %count
  br i1 %cmp.n, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %b.04 = phi i8* [ %14, %.lr.ph ], [ %resume.val, %middle.block ]
  %a.03 = phi i8* [ %16, %.lr.ph ], [ %resume.val12, %middle.block ]
  %.02 = phi i64 [ %13, %.lr.ph ], [ %resume.val14, %middle.block ]
  %13 = add i64 %.02, -1, !dbg !198
  %14 = getelementptr inbounds i8* %b.04, i64 1, !dbg !198
  %15 = load i8* %b.04, align 1, !dbg !198, !tbaa !191
  %16 = getelementptr inbounds i8* %a.03, i64 1, !dbg !198
  store i8 %15, i8* %a.03, align 1, !dbg !198, !tbaa !191
  %17 = icmp eq i64 %13, 0, !dbg !198
  br i1 %17, label %.loopexit, label %.lr.ph, !dbg !198, !llvm.loop !201

; <label>:18                                      ; preds = %2
  %19 = add i64 %count, -1, !dbg !202
  %20 = icmp eq i64 %count, 0, !dbg !204
  br i1 %20, label %.loopexit, label %.lr.ph9, !dbg !204

.lr.ph9:                                          ; preds = %18
  %21 = getelementptr inbounds i8* %src, i64 %19, !dbg !205
  %22 = getelementptr inbounds i8* %dst, i64 %19, !dbg !202
  %n.vec215 = and i64 %count, -32
  %cmp.zero217 = icmp eq i64 %n.vec215, 0
  br i1 %cmp.zero217, label %middle.block210, label %vector.memcheck224

vector.memcheck224:                               ; preds = %.lr.ph9
  %bound1221 = icmp ule i8* %21, %dst
  %bound0220 = icmp ule i8* %22, %src
  %memcheck.conflict223 = and i1 %bound0220, %bound1221
  %.sum = sub i64 %19, %n.vec215
  %rev.ptr.ind.end = getelementptr i8* %src, i64 %.sum
  %rev.ptr.ind.end229 = getelementptr i8* %dst, i64 %.sum
  %rev.ind.end231 = sub i64 %count, %n.vec215
  br i1 %memcheck.conflict223, label %middle.block210, label %vector.body209

vector.body209:                                   ; preds = %vector.body209, %vector.memcheck224
  %index212 = phi i64 [ %index.next234, %vector.body209 ], [ 0, %vector.memcheck224 ]
  %.sum440 = sub i64 %19, %index212
  %next.gep236.sum = add i64 %.sum440, -15, !dbg !204
  %23 = getelementptr i8* %src, i64 %next.gep236.sum, !dbg !204
  %24 = bitcast i8* %23 to <16 x i8>*, !dbg !204
  %wide.load434 = load <16 x i8>* %24, align 1, !dbg !204
  %reverse = shufflevector <16 x i8> %wide.load434, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !204
  %.sum505 = add i64 %.sum440, -31, !dbg !204
  %25 = getelementptr i8* %src, i64 %.sum505, !dbg !204
  %26 = bitcast i8* %25 to <16 x i8>*, !dbg !204
  %wide.load435 = load <16 x i8>* %26, align 1, !dbg !204
  %reverse436 = shufflevector <16 x i8> %wide.load435, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !204
  %reverse437 = shufflevector <16 x i8> %reverse, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !204
  %27 = getelementptr i8* %dst, i64 %next.gep236.sum, !dbg !204
  %28 = bitcast i8* %27 to <16 x i8>*, !dbg !204
  store <16 x i8> %reverse437, <16 x i8>* %28, align 1, !dbg !204
  %reverse438 = shufflevector <16 x i8> %reverse436, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !204
  %29 = getelementptr i8* %dst, i64 %.sum505, !dbg !204
  %30 = bitcast i8* %29 to <16 x i8>*, !dbg !204
  store <16 x i8> %reverse438, <16 x i8>* %30, align 1, !dbg !204
  %index.next234 = add i64 %index212, 32
  %31 = icmp eq i64 %index.next234, %n.vec215
  br i1 %31, label %middle.block210, label %vector.body209, !llvm.loop !206

middle.block210:                                  ; preds = %vector.body209, %vector.memcheck224, %.lr.ph9
  %resume.val225 = phi i8* [ %21, %.lr.ph9 ], [ %21, %vector.memcheck224 ], [ %rev.ptr.ind.end, %vector.body209 ]
  %resume.val227 = phi i8* [ %22, %.lr.ph9 ], [ %22, %vector.memcheck224 ], [ %rev.ptr.ind.end229, %vector.body209 ]
  %resume.val230 = phi i64 [ %count, %.lr.ph9 ], [ %count, %vector.memcheck224 ], [ %rev.ind.end231, %vector.body209 ]
  %new.indc.resume.val232 = phi i64 [ 0, %.lr.ph9 ], [ 0, %vector.memcheck224 ], [ %n.vec215, %vector.body209 ]
  %cmp.n233 = icmp eq i64 %new.indc.resume.val232, %count
  br i1 %cmp.n233, label %.loopexit, label %scalar.ph211

scalar.ph211:                                     ; preds = %scalar.ph211, %middle.block210
  %b.18 = phi i8* [ %33, %scalar.ph211 ], [ %resume.val225, %middle.block210 ]
  %a.17 = phi i8* [ %35, %scalar.ph211 ], [ %resume.val227, %middle.block210 ]
  %.16 = phi i64 [ %32, %scalar.ph211 ], [ %resume.val230, %middle.block210 ]
  %32 = add i64 %.16, -1, !dbg !204
  %33 = getelementptr inbounds i8* %b.18, i64 -1, !dbg !204
  %34 = load i8* %b.18, align 1, !dbg !204, !tbaa !191
  %35 = getelementptr inbounds i8* %a.17, i64 -1, !dbg !204
  store i8 %34, i8* %a.17, align 1, !dbg !204, !tbaa !191
  %36 = icmp eq i64 %32, 0, !dbg !204
  br i1 %36, label %.loopexit, label %scalar.ph211, !dbg !204, !llvm.loop !207

.loopexit:                                        ; preds = %scalar.ph211, %middle.block210, %18, %.lr.ph, %middle.block, %.preheader, %0
  ret i8* %dst, !dbg !208
}

; Function Attrs: nounwind uwtable
define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #4 {
  %1 = icmp eq i64 %len, 0, !dbg !209
  br i1 %1, label %15, label %.lr.ph.preheader, !dbg !209

.lr.ph.preheader:                                 ; preds = %0
  %n.vec = and i64 %len, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %2 = add i64 %len, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep5 = getelementptr i8* %srcaddr, i64 %2
  %scevgep4 = getelementptr i8* %destaddr, i64 %2
  %bound1 = icmp uge i8* %scevgep4, %srcaddr
  %bound0 = icmp uge i8* %scevgep5, %destaddr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %srcaddr, i64 %n.vec
  %ptr.ind.end7 = getelementptr i8* %destaddr, i64 %n.vec
  %rev.ind.end = sub i64 %len, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep104 = getelementptr i8* %destaddr, i64 %index
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !210
  %wide.load = load <16 x i8>* %3, align 1, !dbg !210
  %next.gep.sum280 = or i64 %index, 16, !dbg !210
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum280, !dbg !210
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !210
  %wide.load201 = load <16 x i8>* %5, align 1, !dbg !210
  %6 = bitcast i8* %next.gep104 to <16 x i8>*, !dbg !210
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !210
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum280, !dbg !210
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !210
  store <16 x i8> %wide.load201, <16 x i8>* %8, align 1, !dbg !210
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !211

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %srcaddr, %.lr.ph.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val6 = phi i8* [ %destaddr, %.lr.ph.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end7, %vector.body ]
  %resume.val8 = phi i64 [ %len, %.lr.ph.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %src.03 = phi i8* [ %11, %.lr.ph ], [ %resume.val, %middle.block ]
  %dest.02 = phi i8* [ %13, %.lr.ph ], [ %resume.val6, %middle.block ]
  %.01 = phi i64 [ %10, %.lr.ph ], [ %resume.val8, %middle.block ]
  %10 = add i64 %.01, -1, !dbg !209
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !210
  %12 = load i8* %src.03, align 1, !dbg !210, !tbaa !191
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !210
  store i8 %12, i8* %dest.02, align 1, !dbg !210, !tbaa !191
  %14 = icmp eq i64 %10, 0, !dbg !209
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !209, !llvm.loop !212

._crit_edge:                                      ; preds = %.lr.ph, %middle.block
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %15, !dbg !209

; <label>:15                                      ; preds = %._crit_edge, %0
  %dest.0.lcssa = phi i8* [ %scevgep, %._crit_edge ], [ %destaddr, %0 ]
  ret i8* %dest.0.lcssa, !dbg !213
}

; Function Attrs: nounwind uwtable
define weak i8* @memset(i8* %dst, i32 %s, i64 %count) #4 {
  %1 = icmp eq i64 %count, 0, !dbg !214
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !214

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !215
  br label %3, !dbg !214

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.02 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.01 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.01, -1, !dbg !214
  %5 = getelementptr inbounds i8* %a.02, i64 1, !dbg !215
  store volatile i8 %2, i8* %a.02, align 1, !dbg !215, !tbaa !191
  %6 = icmp eq i64 %4, 0, !dbg !214
  br i1 %6, label %._crit_edge, label %3, !dbg !214

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !216
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false
attributes #4 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nobuiltin noreturn nounwind }
attributes #8 = { nobuiltin nounwind }

!llvm.dbg.cu = !{!0, !9, !20, !34, !46, !59, !79, !94, !109}
!llvm.module.flags = !{!125, !126}
!llvm.ident = !{!127, !127, !127, !127, !127, !127, !127, !127, !127}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/
!1 = metadata !{metadata !"/home/soha/git/tracerXMaster/tracerx/examples/jrExamples/arixExample.c", metadata !"/home/soha/git/tracerXMaster"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 4, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 4} ; [ DW_TAG_subprogram ] [li
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/soha/git/tracerXMaster//home/soha/git/tracerXMaster/tracerx/examples/jrExamples/arixExample.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786449, metadata !10, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !11, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/
!10 = metadata !{metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic"}
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786478, metadata !13, metadata !14, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", i32 12, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_check, null
!13 = metadata !{metadata !"klee_div_zero_check.c", metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic"}
!14 = metadata !{i32 786473, metadata !13}        ; [ DW_TAG_file_type ] [/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/klee_div_zero_check.c]
!15 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = metadata !{null, metadata !17}
!17 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!18 = metadata !{metadata !19}
!19 = metadata !{i32 786689, metadata !12, metadata !"z", metadata !14, i32 16777228, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!20 = metadata !{i32 786449, metadata !21, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !22, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!21 = metadata !{metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/klee_int.c", metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic"}
!22 = metadata !{metadata !23}
!23 = metadata !{i32 786478, metadata !24, metadata !25, metadata !"klee_int", metadata !"klee_int", metadata !"", i32 13, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int, null, null, metadata !31, i32 13} ; [ 
!24 = metadata !{metadata !"klee_int.c", metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic"}
!25 = metadata !{i32 786473, metadata !24}        ; [ DW_TAG_file_type ] [/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/klee_int.c]
!26 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = metadata !{metadata !8, metadata !28}
!28 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !29} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!29 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!30 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!31 = metadata !{metadata !32, metadata !33}
!32 = metadata !{i32 786689, metadata !23, metadata !"name", metadata !25, i32 16777229, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!33 = metadata !{i32 786688, metadata !23, metadata !"x", metadata !25, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!34 = metadata !{i32 786449, metadata !35, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !36, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!35 = metadata !{metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/klee_overshift_check.c", metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic"}
!36 = metadata !{metadata !37}
!37 = metadata !{i32 786478, metadata !38, metadata !39, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"", i32 20, metadata !40, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64, i64)* @klee_overshift_che
!38 = metadata !{metadata !"klee_overshift_check.c", metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic"}
!39 = metadata !{i32 786473, metadata !38}        ; [ DW_TAG_file_type ] [/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!40 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !41, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!41 = metadata !{null, metadata !42, metadata !42}
!42 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!43 = metadata !{metadata !44, metadata !45}
!44 = metadata !{i32 786689, metadata !37, metadata !"bitWidth", metadata !39, i32 16777236, metadata !42, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bitWidth] [line 20]
!45 = metadata !{i32 786689, metadata !37, metadata !"shift", metadata !39, i32 33554452, metadata !42, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [shift] [line 20]
!46 = metadata !{i32 786449, metadata !47, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !48, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!47 = metadata !{metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/klee_range.c", metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic"}
!48 = metadata !{metadata !49}
!49 = metadata !{i32 786478, metadata !50, metadata !51, metadata !"klee_range", metadata !"klee_range", metadata !"", i32 13, metadata !52, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range, null, null, metadata !
!50 = metadata !{metadata !"klee_range.c", metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic"}
!51 = metadata !{i32 786473, metadata !50}        ; [ DW_TAG_file_type ] [/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/klee_range.c]
!52 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !53, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!53 = metadata !{metadata !8, metadata !8, metadata !8, metadata !28}
!54 = metadata !{metadata !55, metadata !56, metadata !57, metadata !58}
!55 = metadata !{i32 786689, metadata !49, metadata !"start", metadata !51, i32 16777229, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 13]
!56 = metadata !{i32 786689, metadata !49, metadata !"end", metadata !51, i32 33554445, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [end] [line 13]
!57 = metadata !{i32 786689, metadata !49, metadata !"name", metadata !51, i32 50331661, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!58 = metadata !{i32 786688, metadata !49, metadata !"x", metadata !51, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!59 = metadata !{i32 786449, metadata !60, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !61, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!60 = metadata !{metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/memcpy.c", metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic"}
!61 = metadata !{metadata !62}
!62 = metadata !{i32 786478, metadata !63, metadata !64, metadata !"memcpy", metadata !"memcpy", metadata !"", i32 12, metadata !65, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !72, i32 12} 
!63 = metadata !{metadata !"memcpy.c", metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic"}
!64 = metadata !{i32 786473, metadata !63}        ; [ DW_TAG_file_type ] [/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/memcpy.c]
!65 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !66, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = metadata !{metadata !67, metadata !67, metadata !68, metadata !70}
!67 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!68 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !69} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!69 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!70 = metadata !{i32 786454, metadata !63, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !71} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!71 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!72 = metadata !{metadata !73, metadata !74, metadata !75, metadata !76, metadata !78}
!73 = metadata !{i32 786689, metadata !62, metadata !"destaddr", metadata !64, i32 16777228, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!74 = metadata !{i32 786689, metadata !62, metadata !"srcaddr", metadata !64, i32 33554444, metadata !68, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!75 = metadata !{i32 786689, metadata !62, metadata !"len", metadata !64, i32 50331660, metadata !70, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!76 = metadata !{i32 786688, metadata !62, metadata !"dest", metadata !64, i32 13, metadata !77, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!77 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !30} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!78 = metadata !{i32 786688, metadata !62, metadata !"src", metadata !64, i32 14, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!79 = metadata !{i32 786449, metadata !80, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !81, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!80 = metadata !{metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/memmove.c", metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic"}
!81 = metadata !{metadata !82}
!82 = metadata !{i32 786478, metadata !83, metadata !84, metadata !"memmove", metadata !"memmove", metadata !"", i32 12, metadata !85, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memmove, null, null, metadata !88, i32 1
!83 = metadata !{metadata !"memmove.c", metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic"}
!84 = metadata !{i32 786473, metadata !83}        ; [ DW_TAG_file_type ] [/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/memmove.c]
!85 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !86, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!86 = metadata !{metadata !67, metadata !67, metadata !68, metadata !87}
!87 = metadata !{i32 786454, metadata !83, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !71} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!88 = metadata !{metadata !89, metadata !90, metadata !91, metadata !92, metadata !93}
!89 = metadata !{i32 786689, metadata !82, metadata !"dst", metadata !84, i32 16777228, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!90 = metadata !{i32 786689, metadata !82, metadata !"src", metadata !84, i32 33554444, metadata !68, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!91 = metadata !{i32 786689, metadata !82, metadata !"count", metadata !84, i32 50331660, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!92 = metadata !{i32 786688, metadata !82, metadata !"a", metadata !84, i32 13, metadata !77, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!93 = metadata !{i32 786688, metadata !82, metadata !"b", metadata !84, i32 14, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 14]
!94 = metadata !{i32 786449, metadata !95, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !96, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!95 = metadata !{metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/mempcpy.c", metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic"}
!96 = metadata !{metadata !97}
!97 = metadata !{i32 786478, metadata !98, metadata !99, metadata !"mempcpy", metadata !"mempcpy", metadata !"", i32 11, metadata !100, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy, null, null, metadata !103, i32
!98 = metadata !{metadata !"mempcpy.c", metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic"}
!99 = metadata !{i32 786473, metadata !98}        ; [ DW_TAG_file_type ] [/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/mempcpy.c]
!100 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !101, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!101 = metadata !{metadata !67, metadata !67, metadata !68, metadata !102}
!102 = metadata !{i32 786454, metadata !98, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !71} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!103 = metadata !{metadata !104, metadata !105, metadata !106, metadata !107, metadata !108}
!104 = metadata !{i32 786689, metadata !97, metadata !"destaddr", metadata !99, i32 16777227, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 11]
!105 = metadata !{i32 786689, metadata !97, metadata !"srcaddr", metadata !99, i32 33554443, metadata !68, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 11]
!106 = metadata !{i32 786689, metadata !97, metadata !"len", metadata !99, i32 50331659, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 11]
!107 = metadata !{i32 786688, metadata !97, metadata !"dest", metadata !99, i32 12, metadata !77, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 12]
!108 = metadata !{i32 786688, metadata !97, metadata !"src", metadata !99, i32 13, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 13]
!109 = metadata !{i32 786449, metadata !110, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !111, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/h
!110 = metadata !{metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/memset.c", metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic"}
!111 = metadata !{metadata !112}
!112 = metadata !{i32 786478, metadata !113, metadata !114, metadata !"memset", metadata !"memset", metadata !"", i32 11, metadata !115, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !118, i32
!113 = metadata !{metadata !"memset.c", metadata !"/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic"}
!114 = metadata !{i32 786473, metadata !113}      ; [ DW_TAG_file_type ] [/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/memset.c]
!115 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !116, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!116 = metadata !{metadata !67, metadata !67, metadata !8, metadata !117}
!117 = metadata !{i32 786454, metadata !113, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !71} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!118 = metadata !{metadata !119, metadata !120, metadata !121, metadata !122}
!119 = metadata !{i32 786689, metadata !112, metadata !"dst", metadata !114, i32 16777227, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 11]
!120 = metadata !{i32 786689, metadata !112, metadata !"s", metadata !114, i32 33554443, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 11]
!121 = metadata !{i32 786689, metadata !112, metadata !"count", metadata !114, i32 50331659, metadata !117, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 11]
!122 = metadata !{i32 786688, metadata !112, metadata !"a", metadata !114, i32 12, metadata !123, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 12]
!123 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !124} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!124 = metadata !{i32 786485, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!125 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!126 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!127 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!128 = metadata !{i32 6, i32 0, metadata !4, null}
!129 = metadata !{i32 7, i32 0, metadata !4, null}
!130 = metadata !{i32 8, i32 0, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!131 = metadata !{i32 9, i32 0, metadata !4, null}
!132 = metadata !{i32 11, i32 0, metadata !4, null}
!133 = metadata !{i32 13, i32 0, metadata !134, null}
!134 = metadata !{i32 786443, metadata !1, metadata !4, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/soha/git/tracerXMaster//home/soha/git/tracerXMaster/tracerx/examples/jrExamples/arixExample.c]
!135 = metadata !{i32 14, i32 0, metadata !136, null}
!136 = metadata !{i32 786443, metadata !1, metadata !134, i32 13, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/soha/git/tracerXMaster//home/soha/git/tracerXMaster/tracerx/examples/jrExamples/arixExample.c]
!137 = metadata !{i32 15, i32 0, metadata !136, null}
!138 = metadata !{i32 16, i32 0, metadata !136, null}
!139 = metadata !{i32 17, i32 0, metadata !140, null}
!140 = metadata !{i32 786443, metadata !1, metadata !134, i32 16, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/soha/git/tracerXMaster//home/soha/git/tracerXMaster/tracerx/examples/jrExamples/arixExample.c]
!141 = metadata !{i32 18, i32 0, metadata !140, null}
!142 = metadata !{i32 21, i32 0, metadata !143, null}
!143 = metadata !{i32 786443, metadata !1, metadata !4, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/soha/git/tracerXMaster//home/soha/git/tracerXMaster/tracerx/examples/jrExamples/arixExample.c]
!144 = metadata !{i32 22, i32 0, metadata !145, null}
!145 = metadata !{i32 786443, metadata !1, metadata !143, i32 21, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/soha/git/tracerXMaster//home/soha/git/tracerXMaster/tracerx/examples/jrExamples/arixExample.c]
!146 = metadata !{i32 23, i32 0, metadata !145, null}
!147 = metadata !{i32 24, i32 0, metadata !145, null}
!148 = metadata !{i32 25, i32 0, metadata !149, null}
!149 = metadata !{i32 786443, metadata !1, metadata !143, i32 24, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/soha/git/tracerXMaster//home/soha/git/tracerXMaster/tracerx/examples/jrExamples/arixExample.c]
!150 = metadata !{i32 26, i32 0, metadata !149, null}
!151 = metadata !{i32 27, i32 0, metadata !149, null}
!152 = metadata !{i32 30, i32 0, metadata !4, null}
!153 = metadata !{i32 31, i32 0, metadata !4, null}
!154 = metadata !{i32 13, i32 0, metadata !155, null}
!155 = metadata !{i32 786443, metadata !13, metadata !12, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/klee_div_zero_check.c]
!156 = metadata !{i32 14, i32 0, metadata !155, null}
!157 = metadata !{i32 15, i32 0, metadata !12, null}
!158 = metadata !{i32 15, i32 0, metadata !23, null}
!159 = metadata !{i32 16, i32 0, metadata !23, null}
!160 = metadata !{metadata !161, metadata !161, i64 0}
!161 = metadata !{metadata !"int", metadata !162, i64 0}
!162 = metadata !{metadata !"omnipotent char", metadata !163, i64 0}
!163 = metadata !{metadata !"Simple C/C++ TBAA"}
!164 = metadata !{i32 21, i32 0, metadata !165, null}
!165 = metadata !{i32 786443, metadata !38, metadata !37, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!166 = metadata !{i32 27, i32 0, metadata !167, null}
!167 = metadata !{i32 786443, metadata !38, metadata !165, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!168 = metadata !{i32 29, i32 0, metadata !37, null}
!169 = metadata !{i32 16, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !50, metadata !49, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/klee_range.c]
!171 = metadata !{i32 17, i32 0, metadata !170, null}
!172 = metadata !{i32 19, i32 0, metadata !173, null}
!173 = metadata !{i32 786443, metadata !50, metadata !49, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/klee_range.c]
!174 = metadata !{i32 22, i32 0, metadata !175, null}
!175 = metadata !{i32 786443, metadata !50, metadata !173, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/klee_range.c]
!176 = metadata !{i32 25, i32 0, metadata !177, null}
!177 = metadata !{i32 786443, metadata !50, metadata !175, i32 25, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/klee_range.c]
!178 = metadata !{i32 26, i32 0, metadata !179, null}
!179 = metadata !{i32 786443, metadata !50, metadata !177, i32 25, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/klee_range.c]
!180 = metadata !{i32 27, i32 0, metadata !179, null}
!181 = metadata !{i32 28, i32 0, metadata !182, null}
!182 = metadata !{i32 786443, metadata !50, metadata !177, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/klee_range.c]
!183 = metadata !{i32 29, i32 0, metadata !182, null}
!184 = metadata !{i32 32, i32 0, metadata !175, null}
!185 = metadata !{i32 34, i32 0, metadata !49, null}
!186 = metadata !{i32 16, i32 0, metadata !62, null}
!187 = metadata !{i32 17, i32 0, metadata !62, null}
!188 = metadata !{metadata !188, metadata !189, metadata !190}
!189 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!190 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!191 = metadata !{metadata !162, metadata !162, i64 0}
!192 = metadata !{metadata !192, metadata !189, metadata !190}
!193 = metadata !{i32 18, i32 0, metadata !62, null}
!194 = metadata !{i32 16, i32 0, metadata !195, null}
!195 = metadata !{i32 786443, metadata !83, metadata !82, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/memmove.c]
!196 = metadata !{i32 19, i32 0, metadata !197, null}
!197 = metadata !{i32 786443, metadata !83, metadata !82, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/memmove.c]
!198 = metadata !{i32 20, i32 0, metadata !199, null}
!199 = metadata !{i32 786443, metadata !83, metadata !197, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/memmove.c]
!200 = metadata !{metadata !200, metadata !189, metadata !190}
!201 = metadata !{metadata !201, metadata !189, metadata !190}
!202 = metadata !{i32 22, i32 0, metadata !203, null}
!203 = metadata !{i32 786443, metadata !83, metadata !197, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/soha/git/tracerXMaster/tracerx/runtime/Intrinsic/memmove.c]
!204 = metadata !{i32 24, i32 0, metadata !203, null}
!205 = metadata !{i32 23, i32 0, metadata !203, null}
!206 = metadata !{metadata !206, metadata !189, metadata !190}
!207 = metadata !{metadata !207, metadata !189, metadata !190}
!208 = metadata !{i32 28, i32 0, metadata !82, null}
!209 = metadata !{i32 15, i32 0, metadata !97, null}
!210 = metadata !{i32 16, i32 0, metadata !97, null}
!211 = metadata !{metadata !211, metadata !189, metadata !190}
!212 = metadata !{metadata !212, metadata !189, metadata !190}
!213 = metadata !{i32 17, i32 0, metadata !97, null}
!214 = metadata !{i32 13, i32 0, metadata !112, null}
!215 = metadata !{i32 14, i32 0, metadata !112, null}
!216 = metadata !{i32 15, i32 0, metadata !112, null}
