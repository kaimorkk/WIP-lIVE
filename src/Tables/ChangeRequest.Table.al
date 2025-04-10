Table 52193656 "Change Request"
{

    fields
    {
        field(1;No;Code[20])
        {

            trigger OnValidate()
            begin
                if No<>xRec.No then begin
                 if not GLSetup.Get() then
                   Error(Text000);
                   GLSetup.TestField("Change Request No.");
                 NoSeriesMgt.TestManual(GLSetup."Change Request No.");
                end;
            end;
        }
        field(2;"Table";Integer)
        {
            TableRelation = "Change Values Table";

            trigger OnValidate()
            begin
                if ChangeValuesTable.Get(Table) then begin
                   ChangeValuesTable.CalcFields("Table Name");
                  "Table Name":=ChangeValuesTable."Table Name";
                end;
            end;
        }
        field(3;"Table Name";Text[80])
        {
            Editable = false;
        }
        field(4;Description;Text[250])
        {
        }
        field(5;Status;Option)
        {
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(6;"No. Series";Code[20])
        {
        }
        field(7;"Created By";Code[20])
        {
            Editable = false;
        }
        field(8;"Date Created";Date)
        {
            Editable = false;
        }
        field(9;"Time Created";Time)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1;No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ChangeValuesTable: Record "Change Values Table";
        GLSetup: Record "General Ledger Setup";
        Text000: label 'Operations setup doesn''''t exist';
}

