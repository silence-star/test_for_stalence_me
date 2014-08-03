.class public Lnubia/ui/NubiaDialog;
.super Ljava/lang/Object;
.source "NubiaDialog.java"

# interfaces
.implements Lnubia/ui/IDialog;


# instance fields
.field mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnubia/ui/NubiaDialog;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public createDialogAnimation(Lcom/android/internal/app/AlertController;)V
    .locals 0
    .parameter "mAlert"

    .prologue
    invoke-virtual {p1}, Lcom/android/internal/app/AlertController;->createNubiaAnimation()V

    return-void
.end method

.method public getAlertDialogBackgroud(Landroid/content/res/TypedArray;II)I
    .locals 1
    .parameter "a"
    .parameter "styleId"
    .parameter "defaultId"

    .prologue
    const v0, 0x1080739

    return v0
.end method

.method public resetAlertDialogLayout()Z
    .locals 1

    .prologue
    const/4 v0, 0x1

    return v0
.end method

.method public resetShowWindowAttributes(Landroid/view/Window;)V
    .locals 2
    .parameter "mWindow"

    .prologue
    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .local v0, mParams:Landroid/view/WindowManager$LayoutParams;
    const/4 v1, -0x1

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    const/4 v1, -0x2

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    const/16 v1, 0x50

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    invoke-virtual {p1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    return-void
.end method

.method public setBlankViewOnClickEvent()Z
    .locals 1

    .prologue
    const/4 v0, 0x1

    return v0
.end method

.method public setCanceledOnTouchOutside(Lcom/android/internal/app/AlertController;Ljava/lang/Boolean;)V
    .locals 0
    .parameter "mAlert"
    .parameter "flag"

    .prologue
    invoke-virtual {p1, p2}, Lcom/android/internal/app/AlertController;->setNubiaCanceledOnTouchOutside(Ljava/lang/Boolean;)V

    return-void
.end method
