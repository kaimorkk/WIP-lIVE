table 70098 "Procurement Plan"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Editable = true;
        }
        field(2; Description; Text[60])
        {
        }
        field(3; "Corporate Strategic Plan ID"; Code[50])
        {
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(4; "Financial Budget ID"; Code[100])
        {
            TableRelation = "G/L Budget Name";
            trigger OnValidate()
            var
                GLBudget: Record "G/L Budget Name";
            begin

                if GLBudget.Get("Financial Budget ID") then begin
                    // "Financial Budget ID" := GLBudget.Description;
                end
            end;
        }
        field(5; "Financial Year Code"; Code[20])
        {
            TableRelation = "CSP Planned Years"."Annual Year Code" where(Current = const(true));
            //Editable = false;

            trigger OnValidate()
            begin
                YearCodes.Reset;
                YearCodes.SetRange(YearCodes."Annual Year Code", rec."Financial Year Code");
                YearCodes.SetRange(Current, true);
                if YearCodes.FindSet then begin
                    rec."Start Date" := YearCodes."Start Date";
                    rec."End Date" := YearCodes."End Date";
                end;
            end;
        }
        field(6; "Start Date"; Date)
        {
        }
        field(7; "End Date"; Date)
        {
        }
        field(8; "Created By"; Code[30])
        {
            Editable = false;
        }
        field(9; "Date Created"; Date)
        {
            Editable = false;
        }
        field(10; "Time Created"; Time)
        {
            Editable = false;
        }
        field(11; "Plan Type"; Option)
        {
            OptionCaption = ' ,Functional,Consolidated';
            OptionMembers = " ",Functional,Consolidated;
        }
        field(12; "Approval Status"; Option)
        {
            Enabled = true;
            OptionCaption = 'Open,Pending Approval,Approved,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(13; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(14; "Echequer Job ID"; Code[20])
        {
            TableRelation = Job."No.";
        }
        field(15; "Total Budget (Goods)"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Type" = const('GOODS'),
                                                                                 "Procurement Plan ID" = field(Code), Blocked = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Total Budget (Works)"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Type" = const('WORKS'),
                                                                                 "Procurement Plan ID" = field(Code), Blocked = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "Total Budget (Services)"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Type" = const('SERVICES'),
                                                                                 "Procurement Plan ID" = field(Code), Blocked = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "Total Budgeted Spend"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Plan ID" = field(Code), Blocked = const(false)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Total Estimated Cost';
        }
        field(19; "Total Actual (Works)"; Decimal)
        {
            Editable = false;
        }
        field(20; "Total Actual (Services)"; Decimal)
        {
            Editable = false;
        }
        field(21; "Total Actual Spend"; Decimal)
        {
            Editable = false;
        }
        field(22; "Spend %"; Decimal)
        {
            Editable = false;
        }
        field(23; "Department Filter"; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(24; "Budget Plan Posted"; Boolean)
        {
        }
        field(25; "Total Actual (Goods)"; Decimal)
        {
            Editable = false;
        }
        field(36; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Department';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            var
                Dim: Record "Dimension Value";
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 1 Code":="Global Dimension 1 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                END;
                
                PurchaseReqDet.VALIDATE(PurchaseReqDet."No."); */

            end;
        }
        field(37; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            var
                Dims: Record "Dimension Value";
            begin
                // ValidateShortcutDimCode(1,"Global Dimension 1 Code");

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN  BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 2 Code":="Global Dimension 2 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                 END;*/

            end;
        }
        field(38; "Global Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            var
                Dim: Record "Dimension Value";
            begin
                // if Dim.Get("Global Dimension 1 Code") then
                //     "Global Dimension 1 Code" := Dim.Name;
                // Dimen := "Global Dimension 3 Code";
                // Dimen := CopyStr(Dimen, 1, 3);
                // "Global Dimension 2 Code" := Dimen;
                // Dimens := "Global Dimension 3 Code";
                // Dimens := CopyStr(Dimens, 1, 1);
                // "Global Dimension 1 Code" := Dimens;

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 3 Code":="Global Dimension 3 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                
                 END;
                
                {IF "Global Dimension 2 Code" = '' THEN
                  EXIT;
                GetGLSetup;
                ValidateDimValue(GLSetup."Global Dimension 2 Code","Global Dimension 2 Code");
                
                }  */

            end;
        }
        field(39; "Consolidated Procurement Plan"; Code[30])
        {
            TableRelation = "Procurement Plan".Code where("Plan Type" = const(Consolidated));

            trigger OnValidate()
            begin
                // plan.RESET;
                // plan.SETRANGE("Consolidated Procurement Plan",plan.Code);
                // IF plan.FIND('-') THEN
                //   "Corporate Strategic Plan ID":= plan."Corporate Strategic Plan ID";
                //   "Document Date":=TODAY;
                //   "Date Created":=TODAY;
                //   "Financial Budget ID":= plan."Financial Budget ID";
                //   "Financial Year Code":= plan."Financial Year Code";
                //   "Start Date":= plan."Start Date";
                //   "End Date":= plan."End Date";
                //   "Time Created":=TIME;



            end;
        }
        field(40; "Planning Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(41; "Total PRN Commitments"; Decimal)
        {
            CalcFormula = sum("Purchase Line".Amount where("Document Type" = const("Purchase Requisition"),
                                                            Status = const(Released),
                                                            "Procurement Plan ID" = field(Code)));
            FieldClass = FlowField;
        }
        field(42; "Total Contract Commitments"; Decimal)
        {
            CalcFormula = sum("Purchase Line".Amount where("Document Type" = const("Blanket Order"),
                                                            Status = const(Released),
                                                            "Procurement Plan ID" = field(Code)));
            FieldClass = FlowField;
        }
        field(43; "Total PO Commitments"; Decimal)
        {
            CalcFormula = sum("Purchase Line".Amount where("Document Type" = const(Order),
                                                            Status = const(Released),
                                                            "Procurement Plan ID" = field(Code),
                                                            "Blanket Order No." = const('')));
            FieldClass = FlowField;
        }
        field(44; "Total Purchase Commitments"; Decimal)
        {
            CalcFormula = sum("Purchase Line".Amount where("Document Type" = filter("Purchase Requisition" | Order | "Blanket Order"),
                                                            Status = const(Released),
                                                            "Procurement Plan ID" = field(Code)));
            FieldClass = FlowField;
        }
        // field(45; "Total Purchase Invoices"; Decimal)
        // {
        //     CalcFormula = sum("Purch. Inv. Line".Amount where("Department Code" = field(Code)));
        //     FieldClass = FlowField;
        // }
        // field(46; "Total Purchase Credit Memos"; Decimal)
        // {
        //     CalcFormula = sum("Purch. Cr. Memo Line".Amount where("Procurement Plan ID" = field(Code)));
        //     FieldClass = FlowField;
        // }
        field(47; "Total Actual Costs"; Decimal)
        {
        }
        field(48; "Available Procurement Budget"; Decimal)
        {
        }
        field(49; "Document Date"; Date)
        {
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDocDim;
            end;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Global Dimension 1 Code", "Global Dimension 2 Code");
            end;
        }
        field(481; Blocked; Boolean)
        {
        }
        field(70000; "Revision Voucher"; Boolean)
        {
        }
        field(70001; Type; Option)
        {
            OptionCaption = ' ,Functional,Consolidated';
            OptionMembers = " ",Functional,Consolidated;
        }
        field(70002; "Plan No"; Code[30])
        {
            TableRelation = if (Type = const(Consolidated)) "Procurement Plan".Code where("Plan Type" = const(Consolidated))
            else
            if (Type = const(Functional)) "Procurement Plan".Code where("Plan Type" = const(Functional));
        }
        field(70003; "Document Type"; Option)
        {
            OptionCaption = 'Procurement Plan,Revision Voucher';
            OptionMembers = "Procurement Plan","Revision Voucher";
        }
        field(70004; Region; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(70005; Directorate; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70006; Department; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field(Directorate));
        }
        field(70007; Constituency; Code[30])
        {
            // TableRelation = Constituency.Code;
        }
        field(70008; "Document Status"; Option)
        {
            Editable = false;
            OptionCaption = 'Draft,Submitted,Posted';
            OptionMembers = Draft,Submitted,Posted;
        }
        field(70009; Posted; Boolean)
        {
        }
        field(70010; "Total AGPO Budgeted"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."AGPO Amount" where("Procurement Plan ID" = field(Code), Blocked = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70011; "Annual Workplan Plan ID"; Code[30])
        {

            TableRelation = "Annual Strategy Workplan".No where("Planning Budget Type" = const("Supplementary"), Archived = const(false), "Strategy Plan ID" = field("Corporate Strategic Plan ID"), "Approval Status" = const(Released), "Global Dimension 1 Code" = field("Global Dimension 1 Code"), "Global Dimension 2 Code" = field("Global Dimension 2 Code"), "Annual Strategy Type" = const(Functional));

            // TableRelation = if (Type = const(Consolidated)) "Annual Strategy Workplan".No where("Strategy Plan ID" = field("Corporate Strategic Plan ID"), "Approval Status" = filter(Released), "Annual Strategy Type" = filter(Organizational))
            // else
            // if (Type = const(Functional)) "Annual Strategy Workplan".No where("Strategy Plan ID" = field("Corporate Strategic Plan ID"), "Approval Status" = filter(Released), "Global Dimension 1 Code" = field("Global Dimension 1 Code"), "Global Dimension 2 Code" = field("Global Dimension 2 Code"), "Annual Strategy Type" = filter(Functional));

        }
        field(70012; "Shortcut Dimension 1 Filter"; Text[100])
        {
            Caption = '1,2,1';
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70013; "Shortcut Dimension 2 Filter"; Text[100])
        {
            Caption = '1,2,2';
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 2 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", Description, Directorate, Department, "Financial Year Code")
        {
        }
        fieldgroup(Brick; "Code", Description, Directorate, Department)
        {
        }
    }

    trigger OnDelete()
    begin
        //E//rror('Error! Kindly note that you are  not allowed to delete this document');
    end;

    trigger OnInsert()
    begin

        if Code = '' then begin
            if Rec."Document Type" = Rec."document type"::"Procurement Plan" then begin
                if Rec."Plan Type" = Rec."Plan type"::Consolidated then begin
                    PurchSetup.Get;
                    PurchSetup.TestField("Procument Plan Nos");
                    NoSeriesMgt.InitSeries(PurchSetup."Procument Plan Nos", xRec.Code, 0D, Code, "No. Series");
                end;
                //"Dept Procument Plan Nos"
                if Rec."Plan Type" = Rec."Plan type"::Functional then begin
                    PurchSetup.Get;
                    PurchSetup.TestField("Dept Procument Plan Nos");
                    NoSeriesMgt.InitSeries(PurchSetup."Dept Procument Plan Nos", xRec.Code, 0D, Code, "No. Series");
                end;
                //"Dept Procument Plan Nos"
            end;

            if Rec."Document Type" = Rec."document type"::"Revision Voucher" then begin

                PurchSetup.Get;
                PurchSetup.TestField("Procument Plan Revision Nos");
                NoSeriesMgt.InitSeries(PurchSetup."Procument Plan Revision Nos", xRec.Code, 0D, Code, "No. Series");
            end;
        end;

        "Created By" := UserId;
        "Date Created" := Today;
        "Time Created" := Time;
        "Document Date" := Today;
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            Employee.Reset;
            Employee.SetRange("No.", UserSetup."Employee No.");
            if Employee.FindSet then begin
                if "Global Dimension 1 Code" = '' then
                    "Global Dimension 1 Code" := Employee."Global Dimension 1 Code";
                "Global Dimension 2 Code" := Employee."Global Dimension 2 Code";
                // Region := Employee.Region;
                Directorate := Employee."Directorate Code";
                Department := Employee."Department Code";
                // Constituency:=Employee.con
            end;
        end;
        YearCodes.Reset();
        YearCodes.SetRange(Current, true);
        YearCodes.SetFilter("Start Date", '<>%1', 0D);
        if YearCodes.FindFirst() then begin
            rec."Financial Year Code" := YearCodes."Annual Year Code";
            Validate(rec."Financial Year Code");
        end;

        /*"End Date":=TIME;
        "Start Date":=TODAY;*/

    end;

    var
        PurchSetup: Record "Procurement Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        YearCodes: Record "CSP Planned Years";
        Dimen: Text;
        Dimens: Text;
        PostCode: Record "Post Code";
        DimMgt: Codeunit DimensionManagement;
        plan: Record "Procurement Plan";
        UserSetup: Record "User Setup";
        Employee: Record Employee;

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        // OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set ID", StrSubstNo('%1 %2', '', Code),
        //     "Global Dimension 1 Code", "Global Dimension 2 Code");

        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
          IF PurchLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;

    procedure AssistEdit(OldVend: Record "Procurement Plan"): Boolean
    var
        Vend: Record "Procurement Plan";
    begin
        with Vend do begin
            Vend := Rec;
            PurchSetup.Get;
            PurchSetup.TestField("Procument Plan Nos");
            if NoSeriesMgt.SelectSeries(PurchSetup."Procument Plan Nos", OldVend."No. Series", "No. Series") then begin
                PurchSetup.Get;
                PurchSetup.TestField("Procument Plan Nos");
                NoSeriesMgt.SetSeries(Code);
                Rec := Vend;
                exit(true);
            end;
        end;
    end;
}

