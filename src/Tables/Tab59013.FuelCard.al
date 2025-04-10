
table 59013 "Fuel Card"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; "Receipt No"; Code[20])
        {
        }
        field(3; "Registration No."; Code[20])
        {
            TableRelation = "Fleet Vehicles."."Registration No.";

            trigger OnValidate()
            begin


                Vehicles.Reset;
                Vehicles.SetRange(Vehicles."Registration No.", "Registration No.");
                if Vehicles.Find('-') then begin

                    Make := Vehicles.Make;
                    Model := Vehicles.Model;
                    "Fuel Card No." := Vehicles."Fuel Card No";
                    "Fuel Card Pin" := Vehicles."Fuel Card Pin";
                    "Allocated Vehicle Limit" := Vehicles."Vehicle Limit";
                end;
                //"Total Allocated Limit":=AllocatedAmount."Document No.";
            end;
        }
        field(4; Make; Text[30])
        {
        }
        field(5; Model; Text[30])
        {
        }
        field(6; "Fuel Card No."; Code[20])
        {
        }
        field(7; "Fuel Card Pin"; Code[20])
        {
        }
        field(8; "Vehicle Limit"; Decimal)
        {
        }
        field(11; "Total Allocated Limit"; Decimal)
        {
            CalcFormula = lookup("Limit Types"."Upper Limit" where(Code = field("Card Type")));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                CalcFields("Total Amount Spend");
                "Total Balance" := "Total Allocated Limit" - Rec."Total Amount Spend";
            end;
        }
        field(12; "Total Balance"; Decimal)
        {
        }
        field(13; "Allocated Vehicle Limit"; Decimal)
        {

            trigger OnValidate()
            begin
                CalcFields("Total Amt Spend per Vehicle");
                "Vehicle Balance" := "Allocated Vehicle Limit" - "Total Amt Spend per Vehicle";
            end;
        }
        field(14; "Vehicle Balance"; Decimal)
        {
        }
        field(16; "No. Series"; Code[20])
        {
        }
        field(17; "Total Amount Spend"; Decimal)
        {
            CalcFormula = sum("Fuel Card Entries".Amount);
            FieldClass = FlowField;
        }
        field(18; "Total Amt Spend per Vehicle"; Decimal)
        {
            CalcFormula = sum("Fuel Card Entries".Amount where(RegNo = field("Registration No.")));
            FieldClass = FlowField;
        }
        field(19; Status; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved,Rejected,Posting;
        }
        field(20; Posted; Boolean)
        {
        }
        field(21; check; Decimal)
        {
            CalcFormula = sum("Vehicle Fuel Card Lines".Amount where("No." = field(No)));
            FieldClass = FlowField;
        }
        field(22; lowerlimit; Decimal)
        {
            CalcFormula = lookup("Limit Types"."Lower Limit" where(Code = field("Card Type")));
            FieldClass = FlowField;
        }
        field(23; "Card Type"; Code[20])
        {
            TableRelation = "Limit Types".Code;

            trigger OnValidate()
            begin
                LimitType.Reset;
                LimitType.SetRange(Code, "Card Type");
                if LimitType.Find('-') then begin
                    "Requisition Interval" := LimitType."Request Duration";
                end;
            end;
        }
        field(24; "Start Date"; Date)
        {

            trigger OnValidate()
            var
                FuelCard: Record "Fuel Card";
                ErrorFuelCard: Label 'A fuel card for the selected date range already exists.';
            begin
                TestField("Registration No.");
                TestField("Card Type");
                "End Date" := CalcDate("Requisition Interval", "Start Date");
                FuelCard.Reset();
                FuelCard.SetFilter("Start Date", '>=%', "Start Date");
                FuelCard.SetFilter("End Date", '<=%', "End Date");
                FuelCard.SetRange("Card Type", "Card Type");
                FuelCard.SetRange("Registration No.", "Registration No.");
                if FuelCard.FindFirst() then
                    Error(ErrorFuelCard);

            end;
        }
        field(25; "End Date"; Date)
        {
            Editable = false;
        }
        field(26; "Requisition Interval"; DateFormula)
        {
        }
        field(27; closed; Boolean)
        {
        }
        field(28; "Created By"; Code[50])
        {
            Tablerelation = "User Setup";
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if No = '' then begin
            FltMgtSetup.Get;
            FltMgtSetup.TestField(FltMgtSetup."Fuel Card No");
            NoSeriesMgt.InitSeries(FltMgtSetup."Fuel Card No", xRec."No. Series", 0D, No, "No. Series");
        end;
        "Created By" := Userid;
    end;

    var
        FltMgtSetup: Record "Fleet Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Vehicles: Record "Fleet Vehicles.";
        AllocatedAmount: Record "Limit Types";
        LimitType: Record "Limit Types";
}

