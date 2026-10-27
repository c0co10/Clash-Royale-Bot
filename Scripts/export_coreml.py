from ultralytics import YOLO
from pathlib import Path


def export(model_path: str, output_dir: str = "Resources"):
    Path(output_dir).mkdir(exist_ok=True)
    model = YOLO(model_path)
    result = model.export(format="coreml", imgsz=640)
    print(f"Exported: {result}")
    return result


def main():
    export("models/detector1_v0.7.13.pt")
    export("models/detector2_v0.7.13.pt")


if __name__ == "__main__":
    main()
