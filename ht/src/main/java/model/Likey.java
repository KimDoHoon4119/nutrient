package model;

public class Likey {
   private int nutno;
   private int memno;
   public int getNutno() {
      return nutno;
   }
   public void setNutno(int nutno) {
      this.nutno = nutno;
   }
   public int getMemno() {
      return memno;
   }
   public void setMemno(int memno) {
      this.memno = memno;
   }
   @Override
   public String toString() {
      return "Likey [nutno=" + nutno + ", memno=" + memno + "]";
   }

}