
table 59017 "Fleet Vehicles."
{
    DrillDownPageID = "Fleet Vehicles List";
    LookupPageID = "Fleet Vehicles List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = "Fixed Asset"."No." /*where("Fixed Asset Type" = const(Vehicle))*/;

            trigger OnValidate()
            begin
                /*
                IF "No." <> xRec."No." THEN BEGIN
                  FASetup.GET;
                  NoSeriesMgt.TestManual(FASetup."Fixed Asset Nos.");
                  "No. Series" := '';
                END;
                */
                CopyFields();

            end;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';

            trigger OnValidate()
            begin
                /*
                IF ("Search Description" = UPPERCASE(xRec.Description)) OR ("Search Description" = '') THEN
                  "Search Description" := Description;
                IF Description <> xRec.Description THEN BEGIN
                  FADeprBook.SETCURRENTKEY("FA No.");
                  FADeprBook.SETRANGE("FA No.","No.");
                  FADeprBook.MODIFYALL(Description,Description);
                END;
                MODIFY(TRUE);
                */

            end;
        }
        field(3; "Search Description"; Code[50])
        {
            Caption = 'Search Description';
        }
        field(4; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
        field(5; "FA Class Code"; Code[10])
        {
            Caption = 'FA Class Code';
            TableRelation = "FA Class";
        }
        field(6; "FA Subclass Code"; Code[10])
        {
            Caption = 'FA Subclass Code';
            TableRelation = "FA Subclass";
        }
        field(7; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                /*
                ValidateShortcutDimCode(1,"Global Dimension 1 Code");
                */

            end;
        }
        field(8; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                /*
                ValidateShortcutDimCode(2,"Global Dimension 2 Code");
                */

            end;
        }
        field(9; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(10; "FA Location Code"; Code[10])
        {
            Caption = 'FA Location Code';
            TableRelation = "FA Location";
        }
        field(11; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                "Vendor No." := FA."Vendor No.";
            end;
        }
        field(12; "Main Asset/Component"; Option)
        {
            Caption = 'Main Asset/Component';
            Editable = false;
            OptionCaption = ' ,Main Asset,Component';
            OptionMembers = " ","Main Asset",Component;
        }
        field(13; "Component of Main Asset"; Code[20])
        {
            Caption = 'Component of Main Asset';
            Editable = false;
            TableRelation = "Fixed Asset";
        }
        field(14; "Budgeted Asset"; Boolean)
        {
            Caption = 'Budgeted Asset';

            trigger OnValidate()
            begin
                /*
                FAMoveEntries.ChangeBudget(Rec);
                */

            end;
        }
        field(15; "Warranty Date"; Date)
        {
            Caption = 'Warranty Date';
        }
        field(16; "Responsible Employee"; Code[20])
        {
            Caption = 'Responsible Employee';
            TableRelation = "Vehicle Drivers".Driver;
        }
        field(17; "Serial No."; Text[30])
        {
            Caption = 'Serial No.';

            trigger OnValidate()
            begin
                "Registration No." := "Serial No.";
                Modify;
            end;
        }
        field(18; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(19; Insured; Boolean)
        {
            CalcFormula = exist("Ins. Coverage Ledger Entry" where("FA No." = field("No."),
                                                                    "Disposed FA" = const(false)));
            Caption = 'Insured';
            Editable = false;
            FieldClass = FlowField;
        }
        field(20; Comment; Boolean)
        {
            CalcFormula = exist("Comment Line" where("Table Name" = const("Fixed Asset"),
                                                      "No." = field("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(21; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(22; Picture; Blob)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
        field(23; "Maintenance Vendor No."; Code[20])
        {
            Caption = 'Maintenance Vendor No.';
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                "Maintenance Vendor No." := FA."Maintenance Vendor No.";
            end;
        }
        field(24; "Under Maintenance"; Boolean)
        {
            Caption = 'Under Maintenance';
        }
        field(25; "Next Service Date"; Date)
        {
            Caption = 'Next Service Date';
        }
        field(26; Inactive; Boolean)
        {
            Caption = 'Inactive';
        }
        field(27; "FA Posting Date Filter"; Date)
        {
            Caption = 'FA Posting Date Filter';
            FieldClass = FlowFilter;
        }
        field(28; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(29; "FA Posting Group"; Code[10])
        {
            Caption = 'FA Posting Group';
            TableRelation = "FA Posting Group";
        }
        field(57042; "Research Center"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(59000; "Last Service Date"; Date)
        {
        }
        field(59001; "Service Interval"; Option)
        {
            OptionMembers = ,Hour,Day,Week,Month,Quarter,Year;
        }
        field(59002; "Service Interval Value"; Integer)
        {
        }
        field(59003; "Last Service No."; Code[10])
        {
        }
        field(59004; Type; Option)
        {
            OptionMembers = " ",Vehicle,Machinery;
        }
        field(59005; Make; Code[100])
        {
            TableRelation = "Vehicle Make".Code;
        }
        field(59006; Model; Code[100])
        {
            TableRelation = "Vehicle Model".Code where(Make = field(Make));
        }
        field(59007; "Year Of Manufacture"; Integer)
        {
        }
        field(59008; "Country Of Origin"; Code[30])
        {
            TableRelation = "Country/Region";
        }
        field(59009; "Start Reading"; Decimal)
        {
        }
        field(59010; Ownership; Option)
        {
            OptionMembers = " ","First Owner","Second Owner","Third Owner","Fourth Owner","Fifth Owner";
        }
        field(59011; "Chassis Serial No."; Code[50])
        {
        }
        field(59012; "Engine Serial No."; Code[50])
        {
        }
        field(59013; "Horse Power"; Decimal)
        {
        }
        field(59014; "Ignition Key Code"; Code[10])
        {
        }
        field(59015; "Door Key Code"; Code[10])
        {
        }
        field(59016; "Body Color"; Code[30])
        {
        }
        field(59017; "Interior Color"; Code[10])
        {
        }
        field(59018; Cylinders; Integer)
        {
        }
        field(59019; "Wheel Size Rear"; Decimal)
        {
        }
        field(59020; "Wheel Size Front"; Decimal)
        {
        }
        field(59021; "Tire Size Rear"; Code[20])
        {
            TableRelation = "Vehicle Tyre Size";
        }
        field(59022; "Tire Size Front"; Code[20])
        {
            TableRelation = "Vehicle Tyre Size";
        }
        field(59023; "Fuel Type"; Option)
        {
            OptionCaption = ' ,Petrol,Diesel,Hybrid,Gas,Electric';
            OptionMembers = " ",Petrol,Diesel,Hybrid,Gas,Electric;
        }
        field(59024; "Fuel Rating"; Decimal)
        {
        }
        field(59025; "Current Reading"; Decimal)
        {
            FieldClass = Normal;
        }
        field(59026; "Registration No."; Code[10])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                //"Registration No.":=FA."Serial No.";
            end;
        }
        field(59027; "Readings Based On"; Option)
        {
            OptionCaption = 'Mileage';
            OptionMembers = Mileage;
        }
        field(59028; "Total Consumption"; Decimal)
        {
            CalcFormula = sum("FA Ledger Entry".Amount where("FA Posting Group" = filter('FUEL'),
                                                              "FA No." = field("No.")));
            FieldClass = FlowField;
        }
        field(59029; "Tare Weight"; Decimal)
        {
        }
        field(59030; Available; Boolean)
        {
        }
        field(59031; "Gross Weight"; Decimal)
        {
        }
        field(59032; "Reason for Unavailability"; Option)
        {
            OptionMembers = " ",Maintenance,Out;
        }
        field(59033; Selected; Boolean)
        {
        }
        field(59034; "Selected By"; Code[20])
        {
        }
        field(59035; "Fuel Card No"; Code[20])
        {
        }
        field(59036; "Fuel Card Pin"; Code[20])
        {
        }
        field(59037; "Vehicle Limit"; Decimal)
        {
            Caption = 'Fuel Card Limit';

            // trigger OnValidate()
            // begin
            //     if "Vehicle Limit" <> xRec."Vehicle Limit" then begin
            //         statusChange.Reset;
            //         statusChange.SetRange(statusChange."User ID", UserId);
            //         statusChange.SetRange(statusChange."Function", statusChange."function"::LimitChange);
            //         if not statusChange.Find('-') then
            //             Error('You dont have Permission to change Vehicle Limit');
            //     end;
            // end;
        }
        field(59038; "Licensing Company"; Text[30])
        {
            Caption = 'Insurance Company';
        }
        field(59039; "Date of Last Insurance"; Date)
        {
        }
        field(59040; "Expiry Date"; Date)
        {
        }
        field(59041; "Licensing Details"; Text[30])
        {
            Caption = 'Insurance Details';
        }
        field(59042; "Vehicle CC"; Code[50])
        {
        }
        field(59043; "Vehicle Status"; Option)
        {
            OptionCaption = 'Available,Under maintenance,Unavailable';
            OptionMembers = Available,"Under maintenance",Unavailable;
        }
        field(59044; "Next Service Milleage"; Decimal)
        {
        }
        field(59045; "Total Trip Milleage"; Decimal)
        {
            CalcFormula = sum("Daily Work Ticket Lines"."Total Kilometres" where("Vehicle Allocated" = field("Registration No."),
                                                                                  "Driver Allocated" = filter(<> '')));
            FieldClass = FlowField;
        }
        field(59046; "Odometer Reading"; Decimal)
        {
            CalcFormula = max("Daily Work Ticket Lines"."Closing Odometer Reading" where("Vehicle Allocated" = field("Registration No.")));
            FieldClass = FlowField;
            DecimalPlaces = 0;
        }
        field(59047; Purchased; Boolean)
        {
        }
        field(59048; Donated; Boolean)
        {
        }
        field(59049; "Project Number"; Code[30])
        {
            TableRelation = Job."No.";
        }
        field(59050; "Vehicle Purchase From"; Option)
        {
            Caption = 'Mode of Acquisition';
            OptionCaption = ' ,Purchased,Donated,Leased';
            OptionMembers = " ",Purchased,Donated,Leased;
        }
        field(59051; "Starting Odometer Reading"; Decimal)
        {
            DecimalPlaces = 0;
        }
        field(59052; "Current Odometer Reading"; Decimal)
        {
            Editable = false;
            DecimalPlaces = 0;
        }
        field(59053; "Passenger Capacity"; Integer)
        {
        }
        field(59054; "Vehicle Owner"; Option)
        {
            OptionCaption = 'Project,Internally Owned,Leased';
            OptionMembers = Project,"Internally Owned",Leased;
        }
        field(59055; "Type of Vehicle"; Text[100])
        {
            TableRelation = "Vehicle Type".Code;
        }
        field(59056; "Date of Purchase"; Date)
        {
            Caption = 'Date of Purchase';
        }
        field(59057; "Specialized use of  Vehicle"; Text[100])
        {
            Caption = 'Specialized Vehicle Use Description';
            Editable = false;
        }
        field(59058; "Sp Equipment on Vehicle"; Text[100])
        {
            caption = 'Specialized Equipment on Vehicle';
        }
        field(59059; "Allocated Employee"; Code[20])
        {
            Caption = 'Responsible Employee';
            TableRelation = Employee;
        }
        field(59060; "Specialized Vehicle Use"; Code[20])
        {
            TableRelation = "Fleet Lookup".Code where(Type = const("Specialized Vehicle Use"));
            trigger OnValidate()
            var
                FleetLookup: Record "Fleet Lookup";
            begin
                FleetLookup.Reset;
                FleetLookup.SetRange(FleetLookup.Type, FleetLookup.Type::"Specialized Vehicle Use");
                FleetLookup.SetRange(Code, "Specialized Vehicle Use");
                FleetLookup.FindFirst;

                "Specialized use of  Vehicle" := FleetLookup.Description;
            end;
        }
        field(59061; "Alternative Number"; Code[10])
        {

        }





    }



    keys
    {
        key(Key1; "No.", "Registration No.")
        {
            Clustered = true;
            SumIndexFields = "Start Reading";
        }
    }

    fieldgroups
    {
    }

    var
        FA: Record "Fixed Asset";
        statusChange: Record "Status Change Permisions";


    procedure CopyFields()
    begin

        FA.Reset;
        if FA.Get("No.") then begin
            //"Maintenance Code":=FA.Description;
            Description := FA.Description;
            "FA Subclass Code" := FA."FA Subclass Code";
            "Location Code" := FA."FA Location Code";
            "Vendor No." := FA."Vendor No.";
            "Main Asset/Component" := FA."Main Asset/Component";
            "Component of Main Asset" := FA."Component of Main Asset";
            "Budgeted Asset" := FA."Budgeted Asset";
            "Allocated Employee" := FA."Responsible Employee";
            "Serial No." := FA."Serial No.";
            "Last Date Modified" := FA."Last Date Modified";
            Blocked := FA.Blocked;
            // "Date of Purchase" := FA."Purchase Date";
            //  Picture:=FA.Image;
            "Maintenance Vendor No." := FA."Maintenance Vendor No.";
            "Under Maintenance" := FA."Under Maintenance";
            "Next Service Date" := FA."Next Service Date";
            Inactive := FA.Inactive;
            "No. Series" := FA."No. Series";
            "FA Posting Group" := FA."FA Posting Group";
            Insured := FA.Insured;
            Comment := FA.Comment;
        end;

        /*
       FA.RESET;
       FA.GET("No.");
       TRANSFERFIELDS(FA);
       "Registration No.":=FA."Serial No.";
       */

    end;
}

