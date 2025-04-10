
table 70159 "Bid Key Staff"
{
    Caption = 'IFS Key Staff';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(2; "No."; Code[20])
        {
            Caption = 'Response No';
            TableRelation = "Purchase Header"."No.";
        }
        field(3; "Staff No."; Code[40])
        {
            Caption = 'Staff No.';
        }
        field(4; "Staff Name"; Text[80])
        {
        }
        field(5; Nationality; Code[50])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(6; "Proposed Project Role ID"; Code[50])
        {
            Description = 'This is the role of each staff on the Project. The system shall apply a filter on the IFS Key Staff Table, for the relevant IFS No, Staff Category, before the user can select the designation (Mapped to Project Role Field)';
            TableRelation = "Project Role Code"."Project Role Code";
        }
        field(7; "Required Project Role"; Text[100])
        {
        }
        field(8; "Staff Category"; Option)
        {
            OptionCaption = ',Management/Executive Staff,Technical Staff,Consultant,Project Mgt Staff,Site/Delivery Staff,Support Staff,Other';
            OptionMembers = ,"Management/Executive Staff","Technical Staff",Consultant,"Project Mgt Staff","Site/Delivery Staff","Support Staff",Other;
        }
        field(9; Profession; Code[50])
        {
        }
        field(10; "Date of Birth"; Date)
        {
        }
        field(11; "Years with Firm"; Decimal)
        {
        }
        field(12; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(13; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(14; "Vendor No."; Code[20])
        {
            TableRelation = Vendor;
        }
        field(15; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(16; "Employment Type"; Option)
        {
            OptionCaption = 'Permanent,Casual,Contract';
            OptionMembers = Permanent,Casual,Contract;
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Staff No.", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
}

