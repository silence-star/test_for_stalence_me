.class public Lcom/android/internal/policy/impl/ExtSmartScreen;
.super Landroid/widget/FrameLayout;
.source "ExtSmartScreen.java"


# instance fields
.field private mCallback:Lcom/android/internal/policy/impl/ExtSmartScreenCallback;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/internal/policy/impl/ExtSmartScreen;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/internal/policy/impl/ExtSmartScreen;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/policy/impl/ExtSmartScreen;->mCallback:Lcom/android/internal/policy/impl/ExtSmartScreenCallback;

    return-void
.end method


# virtual methods
.method public getCallback()Lcom/android/internal/policy/impl/ExtSmartScreenCallback;
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/ExtSmartScreen;->mCallback:Lcom/android/internal/policy/impl/ExtSmartScreenCallback;

    return-object v0
.end method

.method public reset()V
    .locals 0

    .prologue
    return-void
.end method

.method public setCallback(Lcom/android/internal/policy/impl/ExtSmartScreenCallback;)V
    .locals 0
    .parameter "callback"

    .prologue
    iput-object p1, p0, Lcom/android/internal/policy/impl/ExtSmartScreen;->mCallback:Lcom/android/internal/policy/impl/ExtSmartScreenCallback;

    return-void
.end method
