Table 52193771 "Recruitment Needs1"
{
    // DrillDownPageID = "Recruitment Needs";
    // LookupPageID = "Recruitment Needs";

    fields
    {
        field(1;"No.";Code[20])
        {
            NotBlank = false;
        }
        field(2;"Job ID";Code[20])
        {
            NotBlank = false;
            TableRelation = "Company Jobs1"."Job ID";

            trigger OnValidate()
            begin
                Jobs.Reset;
                Jobs.SetRange(Jobs."Job ID","Job ID");
                if Jobs.Find('-') then
                Description:=Jobs."Job Description";
            end;
        }
        field(3;Date;Date)
        {
        }
        field(4;Priority;Option)
        {
            OptionCaption = 'High,Medium,Low';
            OptionMembers = High,Medium,Low;
        }
        field(5;Positions;Integer)
        {
        }
        field(6;Approved;Boolean)
        {

            trigger OnValidate()
            begin
                "Date Approved":=Today;
            end;
        }
        field(7;"Date Approved";Date)
        {
        }
        field(8;Description;Text[200])
        {
        }
        field(9;Stage;Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Recruitment Stages1"."Recruitement Stage";

            trigger OnValidate()
            begin
                /*
                RShort.RESET;
                RShort.SETRANGE(RShort."Need Code","Need Code");
                RShort.SETRANGE(RShort."Stage Code",Stage);
                RShort.CALCSUMS(RShort."Desired Score");
                Score:=RShort."Desired Score";
                */

            end;
        }
        field(10;Score;Decimal)
        {
            FieldClass = Normal;
        }
        field(11;"Stage Code";Code[20])
        {
            TableRelation = "Recruitment Stages1"."Recruitement Stage";
        }
        field(12;Qualified;Boolean)
        {
            FieldClass = Normal;
        }
        field(13;"No Filter";Integer)
        {
            FieldClass = FlowFilter;
        }
        field(14;"Start Date";Date)
        {
        }
        field(15;"End Date";Date)
        {
            Editable = false;
        }
        field(16;"Documentation Link";Text[200])
        {
        }
        field(17;"Turn Around Time";Integer)
        {
            Editable = false;
        }
        field(18;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1,"Global Dimension 1 Code");
            end;
        }
        field(19;"No. Series";Code[10])
        {
            TableRelation = "No. Series";
        }
        field(20;"Reason for Recruitment";Option)
        {
            OptionMembers = " ","New Position","Existing Position";
        }
        field(21;"Appointment Type";Code[10])
        {
            TableRelation = "Employment Contract";
        }
        field(22;"Requested By";Code[30])
        {
        }
        field(23;"Expected Reporting Date";Date)
        {
        }
        field(24;Status;Option)
        {
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Rejected;
        }
        field(25;"Recruitment Cycle";Code[30])
        {
            TableRelation = "Recruitment Cycles1";
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
          HumanResSetup.Get;
          HumanResSetup.TestField(HumanResSetup."Recruitment Needs Nos.");
          NoSeriesMgt.InitSeries(HumanResSetup."Recruitment Needs Nos.",xRec."No. Series",0D,"No.","No. Series");
        end;
         Date:=Today;
         "Requested By":=UserId;
    end;

    var
        Jobs: Record "Company Jobsx1";
        App: Record Applicants1;
        RShort: Record "R. Shortlisting Criteria1";
        DimMgt: Codeunit DimensionManagement;
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;


    procedure ValidateShortcutDimCode(FieldNumber: Integer;var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber,ShortcutDimCode);
        //DimMgt.SaveDefaultDim(DATABASE::"Recruitment Needs","No.",FieldNumber,ShortcutDimCode);
        Modify;
    end;
}

