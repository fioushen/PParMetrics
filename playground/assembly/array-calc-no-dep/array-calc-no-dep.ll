; ModuleID = 'array-calc-no-dep.bc'
source_filename = "./sources/array-calc-no-dep.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline norecurse nounwind optnone uwtable
define i32 @main() local_unnamed_addr #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %2, align 4
  br label %3

; <label>:3:                                      ; preds = %14, %0
  %4 = load i32, i32* %2, align 4
  %5 = icmp ult i32 %4, 100
  br i1 %5, label %6, label %17

; <label>:6:                                      ; preds = %3
  %7 = load i32, i32* %2, align 4
  %8 = zext i32 %7 to i64
  %9 = load i32, i32* %2, align 4
  %10 = zext i32 %9 to i64
  %11 = add i32 0, 0
  %12 = load i32, i32* %2, align 4
  %13 = zext i32 %12 to i64
  br label %14

; <label>:14:                                     ; preds = %6
  %15 = load i32, i32* %2, align 4
  %16 = add i32 %15, 1
  store i32 %16, i32* %2, align 4
  br label %3

; <label>:17:                                     ; preds = %3
  ret i32 0
}

attributes #0 = { noinline norecurse nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0 (https://git.llvm.org/git/clang.git/ 75a36832b158dc653cbf481c4c6ae05f4acbbff8) (https://github.com/llvm-mirror/llvm.git 138d74f09c10f1f47b37659de24cde3939f95873)"}
