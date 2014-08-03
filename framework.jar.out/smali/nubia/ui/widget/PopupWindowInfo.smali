.class public Lnubia/ui/widget/PopupWindowInfo;
.super Ljava/lang/Object;
.source "PopupWindowInfo.java"


# instance fields
.field public mHeight:I

.field public mOnTop:Z


# direct methods
.method public constructor <init>(ZI)V
    .locals 0
    .parameter "onTop"
    .parameter "height"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lnubia/ui/widget/PopupWindowInfo;->mOnTop:Z

    iput p2, p0, Lnubia/ui/widget/PopupWindowInfo;->mHeight:I

    return-void
.end method


# virtual methods
.method public setBeanParams(ZI)V
    .locals 0
    .parameter "onTop"
    .parameter "height"

    .prologue
    iput-boolean p1, p0, Lnubia/ui/widget/PopupWindowInfo;->mOnTop:Z

    iput p2, p0, Lnubia/ui/widget/PopupWindowInfo;->mHeight:I

    return-void
.end method
