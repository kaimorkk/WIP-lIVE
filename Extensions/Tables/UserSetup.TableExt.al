TableExtension 52193456 tableextension52193456 extends "User Setup"
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 1)".


        //Unsupported feature: Code Modification on ""Salespers./Purch. Code"(Field 10).OnValidate".

        //trigger /Purch()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Salespers./Purch. Code" <> '' THEN BEGIN
          ValidateSalesPersonPurchOnUserSetup(Rec);
          UserSetup.SETCURRENTKEY("Salespers./Purch. Code");
          UserSetup.SETRANGE("Salespers./Purch. Code","Salespers./Purch. Code");
          IF UserSetup.FINDFIRST THEN
            ERROR(Text001,"Salespers./Purch. Code",UserSetup."User ID");
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "Salespers./Purch. Code" <> '' THEN BEGIN
        #3..7
        */
        //end;

        //Unsupported feature: Property Deletion (DataClassification) on ""Approver ID"(Field 11)".


        //Unsupported feature: Property Deletion (DataClassification) on "Substitute(Field 16)".

        field(50000; "Member Approval Limit"; Integer)
        {
        }
        field(50001; "Unlimited Member Approval"; Boolean)
        {
        }
        field(50002; Picture; Blob)
        {
            Subtype=Bitmap;
        }
        field(50003; "Employee No."; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            var
                Emp: Record Employee;
            begin
                if Emp.GET("Employee No.") then begin
                    UserName := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                    "E-Mail" := Emp."Company E-Mail";
                    "Global Dimension 1 Code" := Emp."Global Dimension 1 Code";
                    "Shortcut Dimension 2 Code" := Emp."Global Dimension 2 Code";
                    "Employee Name" := Emp.FullName();
                    // "Job Tittle" := Emp."Job Title";
                    Emp."User ID" := Rec."User ID";
                    Emp.Modify();
                end;
            end;
        }
        field(50004; "Loan Amount Approval Limit"; Integer)
        {
            BlankZero = true;
            Caption = 'Loan Amount Approval Limit';

            trigger OnValidate()
            begin
                if "Unlimited Purchase Approval" and ("Purchase Amount Approval Limit" <> 0) then
                    Error(Text003, FieldCaption("Purchase Amount Approval Limit"), FieldCaption("Unlimited Purchase Approval"));
                if "Purchase Amount Approval Limit" < 0 then
                    Error(Text005);
            end;
        }
        field(50005; "Unlimited Loan Approval"; Boolean)
        {
            Caption = 'Unlimited Loan Approval';

            trigger OnValidate()
            begin
                if "Unlimited Purchase Approval" then
                    "Purchase Amount Approval Limit" := 0;
            end;
        }
        field(50006; HOD; Code[50])
        {
        }
        field(50007; "Immediate Supervisor"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(50008; "Reileved Approver"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(50016; "Imprest Account"; Code[20])
        {
            TableRelation = Customer."No.";
            DataClassification = CustomerContent;
        }
        field(54240; Branch; Code[20])
        {
            TableRelation = Branches;
        }
        field(54241; "Show Hiden"; Boolean)
        {
        }
        field(54242; "Customer A\C"; Code[30])
        {
            TableRelation = Customer;
        }
         field(85018; "Can View HR"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(85019; "Can Edit HR"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(57003; "Employee Name"; Text[100])
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50025; "User Signature"; Blob)
        {
            SubType = Memo;
            DataClassification = CustomerContent;
        }
        field(85016; "Approval Title"; Text[200])
        {
            DataClassification = CustomerContent;
        }
        field(50017; UserName; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(57006; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";
            DataClassification = CustomerContent;
        }
        field(59000; "Create New Job"; Boolean)
        {
            Description = '//Restrict Job creation...Ushindi';
            DataClassification = CustomerContent;
        }
        field(59001; "Update Job Status"; Boolean)
        {
            Description = '//Restrict Job modification...Ushindi';
            DataClassification = CustomerContent;
        }
        field(59002; "Resource No"; Code[20])
        {
            Description = '//Link Resource Code Mapping...Ushindi';
            TableRelation = Resource where(Type = filter(Person));
            DataClassification = CustomerContent;
        }
        field(59015; "Payroll View"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(59016; "Post Memo"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(59017; "post surrender"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(59018; "Post Requisition"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(59019; "Accounts User"; Boolean)
        {
            Description = 'Restrict documents view';
            DataClassification = CustomerContent;
        }
        field(59020; "Post Receipts"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(59021; "Lock Imprests"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(59022; "Procurement officer"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(59023; Leave; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(59024; "Reopen Document"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(59025; "Process Claims"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(59026; Receiptionist; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(59027; "Procurement Manager"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(59028; CIDO; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(59029; "Portal User"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70001; "Authorize IFS Creator"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70002; "Finance Dept."; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70003; "Post Purchase Documents"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70004; "ICT Administrator"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(85010; "HOD Finance"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(85012; "Revenue Officer"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(85013; "Audit & Risk Officer"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(85015; "Can Change Profile"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(85017; "Can Manage Workflow"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(69681; "Direct Edit Employee Records"; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(53001; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(53009; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Description = 'Stores the reference of the second global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            DataClassification = CustomerContent;
        }
        field(53010; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
            DataClassification = CustomerContent;
        }
        field(53011; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
            DataClassification = CustomerContent;
        }
        field(69688; "HQ Finance Officer"; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(59031; "Archive Document"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50024; "Allowed To Auto Reverse"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(59032; "Password"; Text[2048])
        {
            ExtendedDatatype = Masked;
            Editable = false;
        }
    }

    procedure GetFullName(UserId: Code[50]): Text
    var
        Users: Record User;
    begin
        Users.Reset;
        Users.Setrange("User Name", UserId);
        if Users.FindFirst() then
            exit(Users."Full Name");
    end;

    procedure GetEmployeeNo(UserId_: Code[50]): Code[20]
    var
        UserSetup: Record "User Setup";
    begin
        if UserSetup.Get(UserId_) then
            exit(UserSetup."Employee No.");
    end;

    procedure GetImprestAccount(EmployeeNo: Code[20]) ImprestA: Text
    var
        UserSetUp: Record "User Setup";
    begin
        UserSetUp.Reset();
        // UserSetUp.SetRange("User ID",);
        UserSetUp.SetRange("Employee No.", EmployeeNo);
        if UserSetUp.FindFirst() then begin
            ImprestA := UserSetUp."Imprest Account";
            exit(ImprestA)
        end else
            Error('There is no UserSetup for employee %1', EmployeeNo);
    end;

    var
        Text003: Label 'You cannot have both a %1 and %2. ';
        Text005: Label 'You cannot have approval limits less than zero.';
        Emp: Record Employee;

}

