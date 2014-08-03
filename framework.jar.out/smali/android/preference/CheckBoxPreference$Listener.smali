.class public Landroid/preference/CheckBoxPreference$Listener;
.super Ljava/lang/Object;
.source "CheckBoxPreference.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/preference/CheckBoxPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Listener"
.end annotation


# instance fields
.field private preferenceManager:Landroid/preference/PreferenceManager;

.field private preferenceScreen:Landroid/preference/PreferenceScreen;

.field final synthetic this$0:Landroid/preference/CheckBoxPreference;


# direct methods
.method public constructor <init>(Landroid/preference/CheckBoxPreference;)V
    .locals 0
    .parameter

    .prologue
    iput-object p1, p0, Landroid/preference/CheckBoxPreference$Listener;->this$0:Landroid/preference/CheckBoxPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 3
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    iget-object v1, p0, Landroid/preference/CheckBoxPreference$Listener;->this$0:Landroid/preference/CheckBoxPreference;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->callChangeListener(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    if-nez p2, :cond_1

    const/4 v1, 0x1

    :goto_0
    invoke-virtual {p1, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    :cond_0
    :goto_1
    return-void

    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    :cond_2
    iget-object v1, p0, Landroid/preference/CheckBoxPreference$Listener;->this$0:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1, p2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    iget-object v1, p0, Landroid/preference/CheckBoxPreference$Listener;->this$0:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1}, Landroid/preference/CheckBoxPreference;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v1

    iput-object v1, p0, Landroid/preference/CheckBoxPreference$Listener;->preferenceManager:Landroid/preference/PreferenceManager;

    iget-object v1, p0, Landroid/preference/CheckBoxPreference$Listener;->preferenceManager:Landroid/preference/PreferenceManager;

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroid/preference/CheckBoxPreference$Listener;->this$0:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1}, Landroid/preference/CheckBoxPreference;->getOnPreferenceClickListener()Landroid/preference/Preference$OnPreferenceClickListener;

    move-result-object v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Landroid/preference/CheckBoxPreference$Listener;->this$0:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1}, Landroid/preference/CheckBoxPreference;->getOnPreferenceClickListener()Landroid/preference/Preference$OnPreferenceClickListener;

    move-result-object v1

    iget-object v2, p0, Landroid/preference/CheckBoxPreference$Listener;->this$0:Landroid/preference/CheckBoxPreference;

    invoke-interface {v1, v2}, Landroid/preference/Preference$OnPreferenceClickListener;->onPreferenceClick(Landroid/preference/Preference;)Z

    move-result v1

    if-nez v1, :cond_0

    :cond_3
    iget-object v1, p0, Landroid/preference/CheckBoxPreference$Listener;->preferenceManager:Landroid/preference/PreferenceManager;

    invoke-virtual {v1}, Landroid/preference/PreferenceManager;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    iput-object v1, p0, Landroid/preference/CheckBoxPreference$Listener;->preferenceScreen:Landroid/preference/PreferenceScreen;

    iget-object v1, p0, Landroid/preference/CheckBoxPreference$Listener;->preferenceScreen:Landroid/preference/PreferenceScreen;

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroid/preference/CheckBoxPreference$Listener;->preferenceManager:Landroid/preference/PreferenceManager;

    invoke-virtual {v1}, Landroid/preference/PreferenceManager;->getOnPreferenceTreeClickListener()Landroid/preference/PreferenceManager$OnPreferenceTreeClickListener;

    move-result-object v0

    .local v0, listener:Landroid/preference/PreferenceManager$OnPreferenceTreeClickListener;
    iget-object v1, p0, Landroid/preference/CheckBoxPreference$Listener;->preferenceScreen:Landroid/preference/PreferenceScreen;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    iget-object v1, p0, Landroid/preference/CheckBoxPreference$Listener;->preferenceScreen:Landroid/preference/PreferenceScreen;

    iget-object v2, p0, Landroid/preference/CheckBoxPreference$Listener;->this$0:Landroid/preference/CheckBoxPreference;

    invoke-interface {v0, v1, v2}, Landroid/preference/PreferenceManager$OnPreferenceTreeClickListener;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1
.end method
