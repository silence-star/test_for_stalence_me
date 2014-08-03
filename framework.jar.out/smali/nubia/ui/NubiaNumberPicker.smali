.class public Lnubia/ui/NubiaNumberPicker;
.super Ljava/lang/Object;
.source "NubiaNumberPicker.java"

# interfaces
.implements Lnubia/ui/INumberPicker;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public setInputTextFocus(Landroid/widget/EditText;)V
    .locals 1
    .parameter "mInputText"

    .prologue
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setFocusable(Z)V

    return-void
.end method
