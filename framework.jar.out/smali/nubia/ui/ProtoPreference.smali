.class public Lnubia/ui/ProtoPreference;
.super Ljava/lang/Object;
.source "ProtoPreference.java"

# interfaces
.implements Lnubia/ui/IPreference;


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnubia/ui/ProtoPreference;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public setCheckBoxPreferenceBindView(Landroid/view/View;ZLandroid/preference/CheckBoxPreference$Listener;)V
    .locals 0
    .parameter "checkboxView"
    .parameter "checked"
    .parameter "mListener"

    .prologue
    check-cast p1, Landroid/widget/Checkable;

    .end local p1
    invoke-interface {p1, p2}, Landroid/widget/Checkable;->setChecked(Z)V

    return-void
.end method
