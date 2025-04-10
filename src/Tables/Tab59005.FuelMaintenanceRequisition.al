
table 59005 "Fuel & Maintenance Requisition"
{
    DrillDownPageID = "Maintenance Requests PO";
    LookupPageID = "Maintenance Requests PO";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Requisition No"; Code[20])
        {
        }
        field(2; "Vehicle Reg No"; Code[20])
        {
            TableRelation = "Fleet Vehicles."."Registration No.";

            trigger OnValidate()
            begin
                WshpFA.Reset;
                WshpFA.SetRange(WshpFA."Registration No.", "Vehicle Reg No");
                if WshpFA.FindFirst then begin
                    "Fixed Asset No" := WshpFA."No.";
                    "Odometer Reading" := WshpFA."Current Reading";
                    "Vehicle Location" := WshpFA."Global Dimension 1 Code";
                    Make := WshpFA.Make;
                    Model := WshpFA.Model;
                    Validate(Driver, WshpFA."Responsible Employee");
                end;
                /* WshpFA.RESET;
                 WshpFA.SETRANGE(WshpFA."No.","Vehicle Reg No");
                 IF WshpFA.FIND('-') THEN
                 "Odometer Reading":=WshpFA."Current Reading"; */

            end;
        }
        field(3; "Vendor(Dealer)"; Code[20])
        {
            TableRelation = Vendor /*where("Vendor Type" = const(Fleet))*/;
            trigger OnValidate()
            begin
                if Vendor.Get("Vendor(Dealer)") then
                    "Vendor Name" := Vendor.Name;
            end;
        }
        field(4; "Quantity of Fuel(Litres)"; Decimal)
        {
        }
        field(5; "Total Price of Fuel"; Decimal)
        {

            trigger OnValidate()
            begin
                //"Price/Litre":= "Total Price of Fuel"/"Quantity of Fuel(Litres)"
            end;
        }
        field(6; "Odometer Reading"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(7; "Request Date"; Date)
        {
            Editable = false;
        }
        field(8; "Date Taken for Fueling"; Date)
        {
        }
        field(9; Status; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved,Rejected,Cancelled,Closed;

            trigger OnValidate()
            begin
                if (Status = Status::Approved) and ("Email Sent" = false) then begin
                    SendFuelMail;

                    if Rec.Type = Rec.Type::Maintenance then
                        // SendMaintenanceEmail();
                    "Email Sent" := true;
                    Modify;
                end;
            end;
        }
        field(10; "Prepared By"; Code[30])
        {
        }
        field(11; "Closed By"; Code[30])
        {
            TableRelation = "User Setup";
        }
        field(12; "Date Closed"; Date)
        {
        }
        field(13; "Vendor Invoice No"; Code[20])
        {
            TableRelation = "Purchase Header" where("Buy-from Vendor No." = field("Vendor(Dealer)"));
        }
        field(14; "Posted Invoice No"; Code[20])
        {
            TableRelation = "Purch. Inv. Header"."No." where("Pay-to Vendor No." = field("Vendor(Dealer)"));
        }
        field(15; Description; Text[250])
        {
        }
        field(16; Department; Code[20])
        {
        }
        field(17; "No. Series"; Code[10])
        {
        }
        field(18; "Vendor Name"; Text[100])
        {
        }
        field(19; "Date Taken for Maintenance"; Date)
        {
        }
        field(20; Type; Option)
        {
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel;
        }
        field(21; "Type of Maintenance"; Option)
        {
            OptionMembers = " ",Repair,"Scheduled Service",Tyre;
        }
        field(22; Driver; Code[10])
        {
            Editable = false;
            trigger OnValidate()
            begin
                Drivers.Reset();
                Drivers.SetRange(Driver, Driver);
                if Drivers.FindFirst then
                    "Driver Name" := Drivers."Driver Name";
            end;
        }
        field(23; "Driver Name"; Text[100])
        {
            Editable = false;
        }
        field(24; "Fixed Asset No"; Code[20])
        {
        }
        field(25; "Litres of Oil"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(26; "Cheque No"; Code[20])
        {

            trigger OnValidate()
            begin
                //ERROR('Testing 123');
                Qoute.Reset;
                Qoute.SetRange(Qoute."Quote No.", "Cheque No");
                if Qoute.Find('-') then
                    "Cheque No" := Qoute."Quote No.";
            end;
        }
        field(27; "Price/Litre"; Decimal)
        {
        }
        field(28; "Type of Fuel"; Option)
        {
            OptionMembers = " ",Petrol,Diesel;
        }
        field(29; Coolant; Decimal)
        {
        }
        field(30; "Battery Water"; Decimal)
        {
        }
        field(31; "Wheel Alignment"; Decimal)
        {
        }
        field(32; "Wheel Balancing"; Decimal)
        {
        }
        field(33; "Car Wash"; Decimal)
        {
        }
        field(35; "Service Code"; Code[20])
        {
            // TableRelation = "Service Items";

            // trigger OnValidate()
            // begin
            //     ServiceData.Reset;
            //     ServiceData.SetRange("Service Code", "Service Code");
            //     if ServiceData.FindSet then begin
            //         "Service Name" := ServiceData."Service Name";
            //         "G/L Account" := ServiceData."G/L Account";
            //         "G/L Account Name" := ServiceData."G/L Account Name";
            //     end;
            // end;
        }
        field(36; "Service Name"; Text[250])
        {
            Editable = false;
        }
        field(37; "G/L Account"; Code[20])
        {
            Editable = false;
        }
        field(38; "G/L Account Name"; Text[250])
        {
            Editable = false;
        }
        field(39; "PO Created By"; Code[50])
        {
        }
        field(40; "Date PO Created"; Date)
        {
        }
        field(41; "PO Created"; Boolean)
        {
        }
        field(42; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(43; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(44; "Department Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(45; "Project Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 2 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(46; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(47; "Unit  Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 3 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(48; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDocDim;
            end;
        }
        field(49; "Project Number"; Code[30])
        {
            TableRelation = Job."No.";
        }
        field(50; "Task Number"; Code[30])
        {
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Project Number"));
        }
        field(51; "Maintenance Cost"; Decimal)
        {
        }
        field(5000; "Job No"; Code[10])
        {
            TableRelation = Job."No.";
        }
        field(5001; "Job Task"; Code[10])
        {
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No"));
        }
        field(5002; "Job Name"; Text[100])
        {
        }
        field(5003; "Job Task Name"; Text[100])
        {
        }
        field(5004; "Requested By"; Code[30])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                if Emp.Get("Requested By") then begin
                    "Shortcut Dimension 1 Code" := Emp."Global Dimension 1 Code";
                    Validate("Shortcut Dimension 1 Code");
                end;
            end;
        }
        field(5005; "Email Sent"; Boolean)
        {
        }
        field(5006; "Vehicle Location"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(5007; "Employee No"; Code[50])
        {
            TableRelation = Employee."No.";
        }
        field(5008; Make; Code[100])
        {
            TableRelation = "Vehicle Make".Code;
            Editable = false;
        }
        field(5009; Model; Code[100])
        {
            TableRelation = "Vehicle Model".Code where(Make = field(Make));
            Editable = false;
        }
        field(5010; "Comments/Remarks"; Text[250])
        {
        }
        field(5011; "Parts Changed"; Text[250])
        {
        }
        field(5012; "Responsible Employee"; Code[20])
        {
            Caption = 'Responsible Employee';
            TableRelation = Employee;
            trigger OnValidate()
            var
                Emp: Record Employee;
            begin
                if Emp.Get("Responsible Employee") then
                    "Responsible Employee Name" := Emp.FullName();
            end;
        }
        field(5013; "Responsible Employee Name"; Code[50])
        {
            Caption = 'Responsible Employee Name';

        }
        field(5014; "Pre-Repair Inspection"; Text[250])
        {

        }
        field(5015; "Post-Repair Inspection"; Text[250])
        {

        }
        field(5016; "Cost Center Name"; Text[250])
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup("Dimension Value".Name where("Dimension Code" = field("Vehicle Location")));
        }
        field(5017; "Transport Requisition No."; Code[50])
        {
            TableRelation = "Transport Requisition"."Transport Requisition No" where(Status = const(Closed));

            trigger OnValidate()
            var
                TransportReq: Record "Transport Requisition";
            begin
                TransportReq.ReSet;
                TransportReq.SetRange("Transport Requisition No", "Transport Requisition No.");
                if TransportReq.FindFirst then begin
                    "Route Code" := TransportReq.Destination;
                    "Route Description" := TransportReq."Route Description";
                end;
            end;

        }

        field(5018; "Route Code"; Code[20])
        {
            Caption = 'Route Code';
            TableRelation = "Fleet Lookup".Code where(Type = const("Route Destination"));
            Editable = false;
            trigger OnValidate()
            var
                FleetLookup: Record "Fleet Lookup";
            begin
                FleetLookup.Reset();
                FleetLookup.SetRange(Type, FleetLookup.Type::"Route Destination");
                FleetLookup.SetRange(Code, "Route Code");
                if FleetLookup.FindFirst() then
                    "Route Description" := FleetLookup.Description;
            end;

        }

        field(5019; "Route Description"; Text[100])
        {
            Editable = false;
        }

    }

    keys
    {
        key(Key1; "Requisition No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Type = Type::Fuel then begin
            if "Requisition No" = '' then begin
                FltMgtSetup.Get;
                FltMgtSetup.TestField(FltMgtSetup."Fuel Register");
                NoSeriesMgt.InitSeries(FltMgtSetup."Fuel Register", xRec."No. Series", 0D, "Requisition No", "No. Series");
            end;
        end else begin
            if Type = Type::Maintenance then begin
                if "Requisition No" = '' then begin
                    FltMgtSetup.Get;
                    FltMgtSetup.TestField(FltMgtSetup."Maintenance Request");
                    NoSeriesMgt.InitSeries(FltMgtSetup."Maintenance Request", xRec."No. Series", 0D, "Requisition No", "No. Series");
                end;
            end;
        end;
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindFirst then
            Empy.Reset;
        Empy.SetRange("No.", UserSetup."Employee No.");
        if Empy.FindSet then begin
            "Requested By" := UserSetup."Employee No.";
            "Vehicle Location" := Empy."Global Dimension 1 Code";
            "Shortcut Dimension 1 Code" := Empy."Global Dimension 1 Code";
            "Shortcut Dimension 2 Code" := Empy."Global Dimension 2 Code";
            Department := Empy."Department Code";
            "Department Name" := Empy."Department Name";


        end;

        "Request Date" := Today;
    end;

    trigger OnModify()
    begin
        Validate(Status);
    end;

    var
        FltMgtSetup: Record "Fleet Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Vendor: Record Vendor;
        Drivers: Record "Vehicle Drivers";
        WshpFA: Record "Fleet Vehicles.";
        Qoute: Record "Purchase Header";
        // ServiceData: Record "Service Items";
        DimMgt: Codeunit DimensionManagement;
        FleetSetup: Record "Fleet Management Setup";
        Filename: Text;
        SMTPSetup: Record "Email Account";
        SMTPMail: Codeunit "Email Message";
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        Emp: Record Employee;
        Empy: Record Employee;
        UserSetup: Record "User Setup";


    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set ID", StrSubstNo('%1 %2', '', "Requisition No"),
        //     "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
    end;

    local procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        if "Requisition No" <> '' then
            Modify;
    end;

    // local procedure SendMaintenanceEmail()
    // var
    //     Mgmt: Codeunit "Vehicle Management";
    //     DriverEmail: Label '<p> The maintence request <b>%1</b> has been approved. Kindly take the vehicle to the dealer.</p>';
    //     VendorEmail: Label '<p> Vehicle Reg No <b>%1</b> is coming for assessment for <b>%2</b>.</p>';
    //     EmailToProcurement: Label '<p>Maintenance No: <b>%1</b> has been approved, proceed to raise an LPO.</p>';
    //     MaintenanceLbl: Label 'Maintenance Request %1 Approved';
    //     Emp: Record Employee;
    //     FuelMaintReq: Record "Fuel & Maintenance Requisition";
    //     Vend: Record Vendor;
    //     ProcurementSetup: Record "Procurement Setup";
    // begin

    //     Emp.Get("Requested By");
    //     Emp.TestField("E-Mail");
    //     Vend.Get("Vendor(Dealer)");
    //     Vend.TestField("E-Mail");
    //     ProcurementSetup.Get;
    //     ProcurementSetup.TestField("Default Proc Email Contact");

    //     Mgmt.SendEmail(ProcurementSetup."Default Proc Email Contact", '', StrSubstNo(MaintenanceLbl, Rec."Requisition No"), 'Greetings,', StrSubstNo(EmailToProcurement, Rec."Requisition No"));
    //     Mgmt.SendEmail(Emp."E-Mail", '', StrSubstNo(MaintenanceLbl, Rec."Requisition No"), 'Greetings,', StrSubstNo(DriverEmail, Rec."Requisition No"));
    //     Mgmt.SendEmail(Vend."E-Mail", '', StrSubstNo(MaintenanceLbl, Rec."Requisition No"), 'Greetings,', StrSubstNo(VendorEmail, Rec."Vehicle Reg No", Rec."Service Name"));

    // end;

    local procedure SendFuelMail()
    begin

        FleetSetup.Get();
        FleetSetup.TestField(FleetSetup."Transport Admin Email");
        Header := 'PRN PREPARATION FOR VEHICLE MAINTENANCE ' + "Vehicle Reg No";

        if SMTPSetup.Get() then begin
            // SenderEmail := SMTPSetup."Email Sender Address";
            // SenderName := SMTPSetup."Email Sender Name";
        end;
        if FleetSetup."Transport Admin Email" <> '' then begin
            //  SMTPMail.Create(SenderName, SenderEmail, FleetSetup."Transport Admin Email", Header, '', true);
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody('Dear Sir/Madam');
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody('Kindly prepare a Purchase requisition for vehicle maintenance, see details below ');// for the month of January 2014');
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody('<h1>Vehicle Maintenance Details</h1>');
            // SMTPMail.AppendToBody('<br>');
            // SMTPMail.AppendToBody('Vehicle Number : ' + "Vehicle Reg No");
            // SMTPMail.AppendToBody('<br>');
            // SMTPMail.AppendToBody('Projected Amount : KES' + Format("Maintenance Cost"));
            // SMTPMail.AppendToBody('<br>');
            // SMTPMail.AppendToBody('Vedor : ' + "Vendor(Dealer)" + ' : ' + "Vendor Name");
            // SMTPMail.AppendToBody('<br>');
            // SMTPMail.AppendToBody('Maintenance Details : ' + Description);
            // SMTPMail.AppendToBody('<br>');
            // SMTPMail.AppendToBody('<br>');
            // SMTPMail.AppendToBody('Thanks & Regards');
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody(SenderName);
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody('<HR>');
            // SMTPMail.AppendToBody('This is a system generated mail.');
            //  SMTPMail.Send;
            // MESSAGE('Mail sent to %1',FleetSetup."Transport Admin Email");
        end;
    end;
}

