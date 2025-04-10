tableextension 50002 "Standard Purchase Line Ext" extends "Standard Purchase Line"
{
    fields
    {
  field(12; "Item Category"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Item Category".Code;
        }
        field(5600; "FA Posting Date"; Date)
        {
            Caption = 'FA Posting Date';
            DataClassification = CustomerContent;
        }
        field(5601; "FA Posting Type"; Option)
        {
            AccessByPermission = TableData "Fixed Asset" = R;
            Caption = 'FA Posting Type';
            DataClassification = CustomerContent;
            OptionCaption = ' ,Acquisition Cost,Maintenance,,Appreciation';
            OptionMembers = " ","Acquisition Cost",Maintenance,,Appreciation;

            trigger OnValidate()
            begin
                // IF Type = Type::"Fixed Asset" THEN BEGIN
                // //  TESTFIELD("Job No.",'');
                //  IF "FA Posting Type" = "FA Posting Type"::" " THEN
                //    "FA Posting Type" := "FA Posting Type"::"Acquisition Cost";
                // //  GetFAPostingGroup;
                // END ELSE BEGIN
                //  "Depreciation Book Code" := '';
                //  "FA Posting Date" := 0D;
                //
                //
                //  "Maintenance Code" := '';
                //
                //
                // END;
            end;
        }
        field(5602; "Depreciation Book Code"; Code[10])
        {
            Caption = 'Depreciation Book Code';
            DataClassification = CustomerContent;
            TableRelation = "Depreciation Book";

            trigger OnValidate()
            begin
                // GetFAPostingGroup;
            end;
        }
        field(5609; "Maintenance Code"; Code[10])
        {
            Caption = 'Maintenance Code';
            DataClassification = CustomerContent;
            TableRelation = Maintenance;
        }
        field(50020; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
        field(70036; "Procurement Plan ID"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Plan".Code;
        }
        field(70037; "Procurement Plan Entry No"; Integer)
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Plan Entry"."Entry No.";


        }
        field(70048; "PP Planning Category"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Plan Entry"."Planning Category";
        }
        field(70049; "PP Funding Source ID"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Plan Entry"."Funding Source ID";
        }
        field(70050; "PP Total Budget"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70051; "PP Total Actual Costs"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70052; "PP Total Commitments"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70053; "PP Total Available Budget"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70054; "PP Solicitation Type"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Solicitation Type".Code;
        }
        field(70055; "PP Procurement Method"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ',Open Tender,RFQ,RFP,Two-Stage Tender,Design Competition Tender,Restricted Tender,Direct Procurement,Low Value Procurement,Force Account,Framework Agreement,Reverse Auction';
            OptionMembers = ,"Open Tender",RFQ,RFP,"Two-Stage Tender","Design Competition Tender","Restricted Tender","Direct Procurement","Low Value Procurement","Force Account","Framework Agreement","Reverse Auction";
        }
        field(70056; "PP Preference/Reservation Code"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Special Vendor Category".Code;
        }
        field(70057; "PRN Conversion Procedure"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Invitation For Supply,Direct PO';
            OptionMembers = "Invitation For Supply","Direct PO";
        }
        field(70058; "Job No."; Code[20])
        {
            Caption = 'Financial Budget';
            DataClassification = CustomerContent;
            // TableRelation = Job;
            TableRelation = "G/L Budget Name".Name;
            trigger OnValidate()
            var
                Job: Record Job;
            begin
            end;
        }
        field(70059; "Job Task No."; Code[20])
        {
            Caption = 'Budget Line';
            DataClassification = CustomerContent;
            // TableRelation = "G/L Budget Entry"."Entry No." where("Budget Name" = field("Job No."), "Global Dimension 1 Code" = FIELD("Shortcut Dimension 1 Code"), "Global Dimension 2 Code" = FIELD("Shortcut Dimension 2 Code"));
            TableRelation = "G/L Account"."No." where(Blocked = const(false));
            //TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No."));
        }
        field(70060; "Requisition No"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Requisition Header1";
        }
        field(70061; "Department Code"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(70062; "Directorate Code"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(70063; Division; Code[50])
        {
            DataClassification = CustomerContent;
            Description = 's';
        }
        field(70064; "Technical Specifications"; Text[2000])
        {
            DataClassification = CustomerContent;
        }
        field(70065; "Sell to Customer No"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer;
        }
    }
}