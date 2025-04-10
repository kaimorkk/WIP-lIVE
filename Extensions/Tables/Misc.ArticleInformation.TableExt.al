TableExtension 52193672 tableextension52193672 extends "Misc. Article Information" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Misc. Article Code"(Field 2).OnValidate".

        //trigger  Article Code"(Field 2)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            MiscArticle.GET("Misc. Article Code");
            Description := MiscArticle.Description;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*

             IF Articles."In Use"= TRUE THEN
             ERROR('The Article is in use!!!');

            MiscArticle.GET("Misc. Article Code");
            Description := MiscArticle.Description;

            Article:=Articles.Type;
            "Serial No.":=Articles."Serial No";
            */
        //end;
        field(50000;Remarks;Text[100])
        {
        }
        field(50001;"Request No.";Code[20])
        {
        }
        field(50002;Article;Code[10])
        {

            trigger OnValidate()
            begin
                //MiscArticle.SETRANGE(MiscArticle.Code,"Misc. Article Code");
                //Description := MiscArticle.Description;
            end;
        }
    }

    var
        Articles: Record Articles1;
}

