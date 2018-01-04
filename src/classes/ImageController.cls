public with sharing class ImageController {
 
 public String imageURL{get;set;}
   
  public ImageController()
  {
    imageURL='/servlet/servlet.FileDownload?file=';
    List< document > documentList=[select name from document where 
                                    Name='TestSignature2'];
   
    if(documentList.size()>0)
    {
      imageURL=imageURL+documentList[0].id;
    }

  }
}