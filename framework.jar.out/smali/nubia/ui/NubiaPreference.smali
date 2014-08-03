.class public Lnubia/ui/NubiaPreference;
.super Ljava/lang/Object;
.source "NubiaPreference.java"

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

    iput-object p1, p0, Lnubia/ui/NubiaPreference;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public setCheckBoxPreferenceBindView(Landroid/view/View;ZLandroid/preference/CheckBoxPreference$Listener;)V
    .locals 2
    .parameter "checkboxView"
    .parameter "checked"
    .parameter "mListener"

    .prologue
    instance-of v1, p1, Landroid/widget/CompoundButton;

    if-eqz v1, :cond_0

    instance-of v1, p1, Landroid/widget/CheckBox;

    if-nez v1, :cond_0

    move-object v0, p1

    check-cast v0, Landroid/widget/CompoundButton;

    .local v0, switchView:Landroid/widget/CompoundButton;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    check-cast p1, Landroid/widget/Checkable;

    .end local p1
    invoke-interface {p1, p2}, Landroid/widget/Checkable;->setChecked(Z)V

    invoke-virtual {v0, p3}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .end local v0           #switchView:Landroid/widget/CompoundButton;
    :goto_0
    return-void

    .restart local p1
    :cond_0
    check-cast p1, Landroid/widget/Checkable;

    .end local p1
    invoke-interface {p1, p2}, Landroid/widget/Checkable;->setChecked(Z)V

    goto :goto_0
.end method
