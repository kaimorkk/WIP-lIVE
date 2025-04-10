Table 52193961 "Sms Contacts1"
{

    fields
    {
        field(1;"No.";Code[10])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                /*IF "No." <> xRec."No." THEN BEGIN
                  RMSetup.GET;
                  NoSeriesMgt.TestManual(RMSetup."Sms Nos");
                  "No. Series" := '';
                END;
                */

            end;
        }
        field(2;"Contact No.";Code[10])
        {
            TableRelation = Contact;

            trigger OnValidate()
            begin
                    if Contact.Get("Contact No.") then
                      "Phone No.":=Contact."Phone No.";
            end;
        }
        field(3;"Phone No.";Text[30])
        {
            ExtendedDatatype = PhoneNo;
        }
        field(4;Message;Text[250])
        {
        }
        field(5;Posted;Boolean)
        {
        }
        field(6;"No. Series";Code[20])
        {
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1;"No.","Phone No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        /*IF "No." = '' THEN BEGIN
           RMSetup.GET;
          RMSetup.TESTFIELD("Sms Nos");
         NoSeriesMgt.InitSeries(RMSetup."Media Nos",xRec."No. Series",0D,"No.","No. Series");
        END;
            */

    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        RMSetup: Record "Marketing Setup";
        Contact: Record Contact;
}

