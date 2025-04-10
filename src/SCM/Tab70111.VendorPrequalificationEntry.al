
table 70111 "Vendor Prequalification Entry"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "IFP No."; Code[20])
        {
        }
        field(3; "Vendor No."; Code[20])
        {
            TableRelation = Vendor;
        }
        field(4; "Procurement Type"; Code[30])
        {
            TableRelation = "Procurement Types".Code;
        }
        field(5; "Procurement Category Code"; Code[30])
        {
            TableRelation = "Procurement Category".Code where(Blocked = const(false));

            trigger OnValidate()
            begin
                ProcurementCategory.Reset;
                ProcurementCategory.SetRange(Code, "Procurement Category Code");
                if ProcurementCategory.FindSet then begin
                    Description := ProcurementCategory.Description;
                    "Procurement Type" := ProcurementCategory."Procurement Type";
                    if Vendors.Get("Vendor No.") then begin
                        "Vendor Name" := Vendors.Name;
                    end;
                end;
            end;
        }
        field(6; Description; Text[250])
        {
        }
        field(7; "Start Date"; Date)
        {
        }
        field(8; "End Date"; Date)
        {
        }
        field(9; Blocked; Boolean)
        {
        }
        field(10; "Date Blocked"; Date)
        {
        }
        field(11; "Document Type"; Option)
        {
            OptionCaption = 'IFP Response,EOI Response,Supplier Registration';
            OptionMembers = "IFP Response","EOI Response","Supplier Registration";
        }
        field(12; "Posting Date"; Date)
        {
        }
        field(13; "Document No."; Code[30])
        {
        }
        field(14; "Financial Year"; Code[30])
        {
            TableRelation = "Annual Reporting Codes".Code where("Current Year" = const(true));

            trigger OnValidate()
            begin
                // AnnualReportingCodes.RESET;
                // AnnualReportingCodes.SETRANGE(Code,"Financial Year");
                // IF AnnualReportingCodes.FINDSET THEN BEGIN
                //  "Start Date":=
                //
                // END;
            end;
        }
        field(15; "Vendor Name"; Text[250])
        {
        }
        field(16; "Vendor Phone No"; Text[300])
        {
            ExtendedDatatype = PhoneNo;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Vendor No.", "Procurement Category Code", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Vendor No.", "Vendor Name")
        {
        }
    }
    var
        ProcurementCategory: Record "Procurement Category";
        AnnualReportingCodes: Record "Annual Reporting Codes";
        Vendors: Record Vendor;
}

