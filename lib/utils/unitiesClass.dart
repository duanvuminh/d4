class Agrs {
  String verificationId;
  String name;
  String handset;
  Agrs.fromLogin(this.verificationId,this.handset);
  Agrs.fromRegister(this.name,this.verificationId);
}
