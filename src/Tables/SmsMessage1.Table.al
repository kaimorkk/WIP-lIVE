Table 52193962 "Sms Message1"
{

    fields
    {
        field(1;"No.";Code[20])
        {

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                  RMSetup.Get;
                  NoSeriesMgt.TestManual(RMSetup."Sms Nos");
                  "No. Series" := '';
                end;
            end;
        }
        field(2;Message;Text[250])
        {
        }
        field(3;Date;Date)
        {

            trigger OnValidate()
            begin
                Date:=Today;
            end;
        }
        field(4;"No. Series";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5;Posted;Boolean)
        {
        }
        field(6;Department;Code[10])
        {
        }
        field(7;"User ID";Code[20])
        {
        }
        field(8;"Department Name";Text[50])
        {
        }
    }

    keys
    {
        key(Key1;"No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
           RMSetup.Get;
          RMSetup.TestField("Sms Nos");
         NoSeriesMgt.InitSeries(RMSetup."Sms Nos",xRec."No. Series",0D,"No.","No. Series");
        end;


        "User ID":=UserId;
        Date:=Today;

          UserSetup.Reset;
          UserSetup.SetRange(UserSetup."User ID",UserId);
          if UserSetup.Find('+') then  begin
           // Employee.RESET;
            if Employee.Get(UserSetup."Employee No.") then
              Department:=Employee."Global Dimension 1 Code";
              // MESSAGE('USER %1 DEPT %2',USERID,Department);
         // Dimension.RESET;
          if Dimension.Get('DEPARTMENT',Department) then
            "Department Name":=Dimension.Name;
            // MESSAGE('USER %1 DEPT %2',USERID,"Department Name");
          end;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        RMSetup: Record "Marketing Setup";
        UserSetup: Record "User Setup";
        Employee: Record Employee;
        Dimension: Record "Dimension Value";
}

