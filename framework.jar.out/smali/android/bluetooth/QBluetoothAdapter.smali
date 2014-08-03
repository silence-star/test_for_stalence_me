.class public final Landroid/bluetooth/QBluetoothAdapter;
.super Ljava/lang/Object;
.source "QBluetoothAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/bluetooth/QBluetoothAdapter$LeLppClientWrapper;,
        Landroid/bluetooth/QBluetoothAdapter$LEExtendedScanClientWrapper;,
        Landroid/bluetooth/QBluetoothAdapter$LeLppCallback;
    }
.end annotation


# static fields
.field private static final BT_LE_EXTENDED_SCAN_PROP:Ljava/lang/String; = "ro.qc.bluetooth.le.extendedscan"

.field private static final DBG:Z = false

.field private static final MAX_LE_EXTENDED_SCAN_FILTER_ENTRIES:I = 0x80

.field private static final TAG:Ljava/lang/String; = "QBluetoothAdapter"

.field private static final VDBG:Z

.field private static mAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private static sAdapter:Landroid/bluetooth/QBluetoothAdapter;


# instance fields
.field private final mAdapterServiceCallback:Landroid/bluetooth/IBluetoothManagerCallback;

.field private mLeExtendedScanFlag:Z

.field private mLeScanClient:Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Pair",
            "<",
            "Landroid/bluetooth/BluetoothAdapter$LeScanCallback;",
            "Landroid/bluetooth/QBluetoothAdapter$LEExtendedScanClientWrapper;",
            ">;"
        }
    .end annotation
.end field

.field private final mLppClients:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Landroid/bluetooth/QBluetoothAdapter$LeLppCallback;",
            "Landroid/bluetooth/QBluetoothAdapter$LeLppClientWrapper;",
            ">;"
        }
    .end annotation
.end field

.field private final mManagerCallback:Landroid/bluetooth/IQBluetoothManagerCallback;

.field private final mManagerService:Landroid/bluetooth/IBluetoothManager;

.field private mQService:Landroid/bluetooth/IQBluetooth;

.field private final mScanLock:Ljava/lang/Object;

.field private mService:Landroid/bluetooth/IBluetooth;


# direct methods
.method constructor <init>(Landroid/bluetooth/IBluetoothManager;)V
    .locals 5
    .parameter "managerService"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v2, 0x0

    iput-boolean v2, p0, Landroid/bluetooth/QBluetoothAdapter;->mLeExtendedScanFlag:Z

    const/4 v2, 0x0

    iput-object v2, p0, Landroid/bluetooth/QBluetoothAdapter;->mLeScanClient:Landroid/util/Pair;

    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Landroid/bluetooth/QBluetoothAdapter;->mScanLock:Ljava/lang/Object;

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Landroid/bluetooth/QBluetoothAdapter;->mLppClients:Ljava/util/Map;

    new-instance v2, Landroid/bluetooth/QBluetoothAdapter$1;

    invoke-direct {v2, p0}, Landroid/bluetooth/QBluetoothAdapter$1;-><init>(Landroid/bluetooth/QBluetoothAdapter;)V

    iput-object v2, p0, Landroid/bluetooth/QBluetoothAdapter;->mAdapterServiceCallback:Landroid/bluetooth/IBluetoothManagerCallback;

    new-instance v2, Landroid/bluetooth/QBluetoothAdapter$2;

    invoke-direct {v2, p0}, Landroid/bluetooth/QBluetoothAdapter$2;-><init>(Landroid/bluetooth/QBluetoothAdapter;)V

    iput-object v2, p0, Landroid/bluetooth/QBluetoothAdapter;->mManagerCallback:Landroid/bluetooth/IQBluetoothManagerCallback;

    if-nez p1, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "bluetooth manager service is null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_0
    :try_start_0
    sget-object v2, Landroid/bluetooth/QBluetoothAdapter;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    iget-object v3, p0, Landroid/bluetooth/QBluetoothAdapter;->mAdapterServiceCallback:Landroid/bluetooth/IBluetoothManagerCallback;

    invoke-virtual {v2, v3}, Landroid/bluetooth/BluetoothAdapter;->getBluetoothService(Landroid/bluetooth/IBluetoothManagerCallback;)Landroid/bluetooth/IBluetooth;

    move-result-object v2

    iput-object v2, p0, Landroid/bluetooth/QBluetoothAdapter;->mService:Landroid/bluetooth/IBluetooth;

    iget-object v2, p0, Landroid/bluetooth/QBluetoothAdapter;->mManagerCallback:Landroid/bluetooth/IQBluetoothManagerCallback;

    invoke-interface {p1, v2}, Landroid/bluetooth/IBluetoothManager;->registerQAdapter(Landroid/bluetooth/IQBluetoothManagerCallback;)Landroid/bluetooth/IQBluetooth;

    move-result-object v2

    iput-object v2, p0, Landroid/bluetooth/QBluetoothAdapter;->mQService:Landroid/bluetooth/IQBluetooth;

    const-string v2, "QBluetoothAdapter"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "mQService= :"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/bluetooth/QBluetoothAdapter;->mQService:Landroid/bluetooth/IQBluetooth;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iput-object p1, p0, Landroid/bluetooth/QBluetoothAdapter;->mManagerService:Landroid/bluetooth/IBluetoothManager;

    const-string v2, "ro.qc.bluetooth.le.extendedscan"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .local v1, value:Ljava/lang/String;
    if-nez v1, :cond_1

    const-string v2, "QBluetoothAdapter"

    const-string v3, "cannot read property ro.qc.bluetooth.le.extendedscan"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/bluetooth/QBluetoothAdapter;->mLeExtendedScanFlag:Z

    return-void

    .end local v1           #value:Ljava/lang/String;
    :catch_0
    move-exception v0

    .local v0, e:Landroid/os/RemoteException;
    const-string v2, "QBluetoothAdapter"

    const-string v3, ""

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .end local v0           #e:Landroid/os/RemoteException;
    .restart local v1       #value:Ljava/lang/String;
    :cond_1
    const-string v2, "QBluetoothAdapter"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "property ro.qc.bluetooth.le.extendedscanvalue="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method static synthetic access$000(Landroid/bluetooth/QBluetoothAdapter;)Landroid/bluetooth/IBluetoothManagerCallback;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Landroid/bluetooth/QBluetoothAdapter;->mAdapterServiceCallback:Landroid/bluetooth/IBluetoothManagerCallback;

    return-object v0
.end method

.method static synthetic access$100(Landroid/bluetooth/QBluetoothAdapter;)Landroid/bluetooth/IBluetooth;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Landroid/bluetooth/QBluetoothAdapter;->mService:Landroid/bluetooth/IBluetooth;

    return-object v0
.end method

.method static synthetic access$102(Landroid/bluetooth/QBluetoothAdapter;Landroid/bluetooth/IBluetooth;)Landroid/bluetooth/IBluetooth;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput-object p1, p0, Landroid/bluetooth/QBluetoothAdapter;->mService:Landroid/bluetooth/IBluetooth;

    return-object p1
.end method

.method static synthetic access$200(Landroid/bluetooth/QBluetoothAdapter;)Landroid/bluetooth/IQBluetooth;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Landroid/bluetooth/QBluetoothAdapter;->mQService:Landroid/bluetooth/IQBluetooth;

    return-object v0
.end method

.method static synthetic access$202(Landroid/bluetooth/QBluetoothAdapter;Landroid/bluetooth/IQBluetooth;)Landroid/bluetooth/IQBluetooth;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput-object p1, p0, Landroid/bluetooth/QBluetoothAdapter;->mQService:Landroid/bluetooth/IQBluetooth;

    return-object p1
.end method

.method static synthetic access$300(Landroid/bluetooth/QBluetoothAdapter;)Landroid/bluetooth/IBluetoothManager;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Landroid/bluetooth/QBluetoothAdapter;->mManagerService:Landroid/bluetooth/IBluetoothManager;

    return-object v0
.end method

.method static synthetic access$400(Landroid/bluetooth/QBluetoothAdapter;)Landroid/bluetooth/IQBluetoothManagerCallback;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Landroid/bluetooth/QBluetoothAdapter;->mManagerCallback:Landroid/bluetooth/IQBluetoothManagerCallback;

    return-object v0
.end method

.method public static declared-synchronized getDefaultAdapter()Landroid/bluetooth/QBluetoothAdapter;
    .locals 3

    .prologue
    const-class v2, Landroid/bluetooth/QBluetoothAdapter;

    monitor-enter v2

    :try_start_0
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v1

    sput-object v1, Landroid/bluetooth/QBluetoothAdapter;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    sget-object v1, Landroid/bluetooth/QBluetoothAdapter;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothAdapter;->getBluetoothManager()Landroid/bluetooth/IBluetoothManager;

    move-result-object v0

    .local v0, managerService:Landroid/bluetooth/IBluetoothManager;
    new-instance v1, Landroid/bluetooth/QBluetoothAdapter;

    invoke-direct {v1, v0}, Landroid/bluetooth/QBluetoothAdapter;-><init>(Landroid/bluetooth/IBluetoothManager;)V

    sput-object v1, Landroid/bluetooth/QBluetoothAdapter;->sAdapter:Landroid/bluetooth/QBluetoothAdapter;

    sget-object v1, Landroid/bluetooth/QBluetoothAdapter;->sAdapter:Landroid/bluetooth/QBluetoothAdapter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v2

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method


# virtual methods
.method public enableRssiMonitor(Landroid/bluetooth/QBluetoothAdapter$LeLppCallback;Z)Z
    .locals 4
    .parameter "client"
    .parameter "enable"

    .prologue
    const/4 v1, 0x0

    .local v1, wrapper:Landroid/bluetooth/QBluetoothAdapter$LeLppClientWrapper;
    iget-object v3, p0, Landroid/bluetooth/QBluetoothAdapter;->mLppClients:Ljava/util/Map;

    monitor-enter v3

    :try_start_0
    iget-object v2, p0, Landroid/bluetooth/QBluetoothAdapter;->mLppClients:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Landroid/bluetooth/QBluetoothAdapter$LeLppClientWrapper;

    move-object v1, v0

    monitor-exit v3

    if-nez v1, :cond_0

    const/4 v2, 0x0

    :goto_0
    return v2

    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    :cond_0
    invoke-virtual {v1, p2}, Landroid/bluetooth/QBluetoothAdapter$LeLppClientWrapper;->enableMonitor(Z)V

    const/4 v2, 0x1

    goto :goto_0
.end method

.method protected finalize()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    :try_start_0
    iget-object v1, p0, Landroid/bluetooth/QBluetoothAdapter;->mManagerService:Landroid/bluetooth/IBluetoothManager;

    iget-object v2, p0, Landroid/bluetooth/QBluetoothAdapter;->mManagerCallback:Landroid/bluetooth/IQBluetoothManagerCallback;

    invoke-interface {v1, v2}, Landroid/bluetooth/IBluetoothManager;->unregisterQAdapter(Landroid/bluetooth/IQBluetoothManagerCallback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, e:Landroid/os/RemoteException;
    :try_start_1
    const-string v1, "QBluetoothAdapter"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    goto :goto_0

    .end local v0           #e:Landroid/os/RemoteException;
    :catchall_0
    move-exception v1

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v1
.end method

.method public readRssiThreshold(Landroid/bluetooth/QBluetoothAdapter$LeLppCallback;)Z
    .locals 4
    .parameter "client"

    .prologue
    const/4 v1, 0x0

    .local v1, wrapper:Landroid/bluetooth/QBluetoothAdapter$LeLppClientWrapper;
    iget-object v3, p0, Landroid/bluetooth/QBluetoothAdapter;->mLppClients:Ljava/util/Map;

    monitor-enter v3

    :try_start_0
    iget-object v2, p0, Landroid/bluetooth/QBluetoothAdapter;->mLppClients:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Landroid/bluetooth/QBluetoothAdapter$LeLppClientWrapper;

    move-object v1, v0

    monitor-exit v3

    if-nez v1, :cond_0

    const/4 v2, 0x0

    :goto_0
    return v2

    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    :cond_0
    invoke-virtual {v1}, Landroid/bluetooth/QBluetoothAdapter$LeLppClientWrapper;->readRssiThreshold()V

    const/4 v2, 0x1

    goto :goto_0
.end method

.method public registerLppClient(Landroid/bluetooth/QBluetoothAdapter$LeLppCallback;Ljava/lang/String;Z)Z
    .locals 5
    .parameter "client"
    .parameter "address"
    .parameter "add"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    iget-object v3, p0, Landroid/bluetooth/QBluetoothAdapter;->mLppClients:Ljava/util/Map;

    monitor-enter v3

    if-eqz p3, :cond_2

    :try_start_0
    iget-object v4, p0, Landroid/bluetooth/QBluetoothAdapter;->mLppClients:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const-string v2, "QBluetoothAdapter"

    const-string v4, "Lpp Client has been already registered"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v3

    :goto_0
    return v1

    :cond_0
    new-instance v0, Landroid/bluetooth/QBluetoothAdapter$LeLppClientWrapper;

    iget-object v4, p0, Landroid/bluetooth/QBluetoothAdapter;->mQService:Landroid/bluetooth/IQBluetooth;

    invoke-direct {v0, p0, v4, p2, p1}, Landroid/bluetooth/QBluetoothAdapter$LeLppClientWrapper;-><init>(Landroid/bluetooth/QBluetoothAdapter;Landroid/bluetooth/IQBluetooth;Ljava/lang/String;Landroid/bluetooth/QBluetoothAdapter$LeLppCallback;)V

    .local v0, wrapper:Landroid/bluetooth/QBluetoothAdapter$LeLppClientWrapper;
    if-eqz v0, :cond_1

    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Landroid/bluetooth/QBluetoothAdapter$LeLppClientWrapper;->register2(Z)Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v1, p0, Landroid/bluetooth/QBluetoothAdapter;->mLppClients:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v3

    move v1, v2

    goto :goto_0

    :cond_1
    monitor-exit v3

    goto :goto_0

    .end local v0           #wrapper:Landroid/bluetooth/QBluetoothAdapter$LeLppClientWrapper;
    :catchall_0
    move-exception v1

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_2
    :try_start_1
    iget-object v4, p0, Landroid/bluetooth/QBluetoothAdapter;->mLppClients:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/QBluetoothAdapter$LeLppClientWrapper;

    .restart local v0       #wrapper:Landroid/bluetooth/QBluetoothAdapter$LeLppClientWrapper;
    if-eqz v0, :cond_3

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/bluetooth/QBluetoothAdapter$LeLppClientWrapper;->register2(Z)Z

    monitor-exit v3

    move v1, v2

    goto :goto_0

    :cond_3
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public startLeScanEx([Landroid/bluetooth/BluetoothLEServiceUuid;Landroid/bluetooth/BluetoothAdapter$LeScanCallback;)Z
    .locals 4
    .parameter "serviceUuids"
    .parameter "callback"

    .prologue
    const/4 v1, 0x0

    iget-boolean v2, p0, Landroid/bluetooth/QBluetoothAdapter;->mLeExtendedScanFlag:Z

    if-nez v2, :cond_1

    :cond_0
    :goto_0
    return v1

    :cond_1
    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    array-length v2, p1

    if-eqz v2, :cond_0

    array-length v2, p1

    const/16 v3, 0x80

    if-gt v2, v3, :cond_0

    iget-object v2, p0, Landroid/bluetooth/QBluetoothAdapter;->mScanLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v3, p0, Landroid/bluetooth/QBluetoothAdapter;->mLeScanClient:Landroid/util/Pair;

    if-eqz v3, :cond_3

    iget-object v3, p0, Landroid/bluetooth/QBluetoothAdapter;->mLeScanClient:Landroid/util/Pair;

    iget-object v3, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    if-ne v3, p2, :cond_2

    :cond_2
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_3
    :try_start_1
    iget-object v3, p0, Landroid/bluetooth/QBluetoothAdapter;->mQService:Landroid/bluetooth/IQBluetooth;

    if-nez v3, :cond_4

    monitor-exit v2

    goto :goto_0

    :cond_4
    new-instance v0, Landroid/bluetooth/QBluetoothAdapter$LEExtendedScanClientWrapper;

    iget-object v3, p0, Landroid/bluetooth/QBluetoothAdapter;->mQService:Landroid/bluetooth/IQBluetooth;

    invoke-direct {v0, p0, v3, p1, p2}, Landroid/bluetooth/QBluetoothAdapter$LEExtendedScanClientWrapper;-><init>(Landroid/bluetooth/QBluetoothAdapter;Landroid/bluetooth/IQBluetooth;[Landroid/bluetooth/BluetoothLEServiceUuid;Landroid/bluetooth/BluetoothAdapter$LeScanCallback;)V

    .local v0, wrapper:Landroid/bluetooth/QBluetoothAdapter$LEExtendedScanClientWrapper;
    if-eqz v0, :cond_6

    invoke-virtual {v0}, Landroid/bluetooth/QBluetoothAdapter$LEExtendedScanClientWrapper;->startScan()Z

    move-result v3

    if-eqz v3, :cond_6

    new-instance v3, Landroid/util/Pair;

    invoke-direct {v3, p2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v3, p0, Landroid/bluetooth/QBluetoothAdapter;->mLeScanClient:Landroid/util/Pair;

    iget-object v3, p0, Landroid/bluetooth/QBluetoothAdapter;->mLeScanClient:Landroid/util/Pair;

    if-nez v3, :cond_5

    invoke-virtual {v0}, Landroid/bluetooth/QBluetoothAdapter$LEExtendedScanClientWrapper;->stopScan()V

    monitor-exit v2

    goto :goto_0

    :cond_5
    const/4 v1, 0x1

    monitor-exit v2

    goto :goto_0

    :cond_6
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public stopLeScanEx(Landroid/bluetooth/BluetoothAdapter$LeScanCallback;)V
    .locals 3
    .parameter "callback"

    .prologue
    iget-object v2, p0, Landroid/bluetooth/QBluetoothAdapter;->mScanLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v1, p0, Landroid/bluetooth/QBluetoothAdapter;->mLeScanClient:Landroid/util/Pair;

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/bluetooth/QBluetoothAdapter;->mLeScanClient:Landroid/util/Pair;

    iget-object v1, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    if-ne v1, p1, :cond_1

    iget-object v1, p0, Landroid/bluetooth/QBluetoothAdapter;->mLeScanClient:Landroid/util/Pair;

    iget-object v0, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Landroid/bluetooth/QBluetoothAdapter$LEExtendedScanClientWrapper;

    .local v0, wrapper:Landroid/bluetooth/QBluetoothAdapter$LEExtendedScanClientWrapper;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/bluetooth/QBluetoothAdapter$LEExtendedScanClientWrapper;->stopScan()V

    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Landroid/bluetooth/QBluetoothAdapter;->mLeScanClient:Landroid/util/Pair;

    .end local v0           #wrapper:Landroid/bluetooth/QBluetoothAdapter$LEExtendedScanClientWrapper;
    :cond_1
    monitor-exit v2

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public writeRssiThreshold(Landroid/bluetooth/QBluetoothAdapter$LeLppCallback;II)Z
    .locals 4
    .parameter "client"
    .parameter "min"
    .parameter "max"

    .prologue
    const/4 v1, 0x0

    .local v1, wrapper:Landroid/bluetooth/QBluetoothAdapter$LeLppClientWrapper;
    iget-object v3, p0, Landroid/bluetooth/QBluetoothAdapter;->mLppClients:Ljava/util/Map;

    monitor-enter v3

    :try_start_0
    iget-object v2, p0, Landroid/bluetooth/QBluetoothAdapter;->mLppClients:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Landroid/bluetooth/QBluetoothAdapter$LeLppClientWrapper;

    move-object v1, v0

    monitor-exit v3

    if-nez v1, :cond_0

    const/4 v2, 0x0

    :goto_0
    return v2

    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    :cond_0
    int-to-byte v2, p2

    int-to-byte v3, p3

    invoke-virtual {v1, v2, v3}, Landroid/bluetooth/QBluetoothAdapter$LeLppClientWrapper;->writeRssiThreshold(BB)V

    const/4 v2, 0x1

    goto :goto_0
.end method
