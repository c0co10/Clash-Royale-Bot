from ultralytics import YOLO
from pathlib import Path


def export(model_path: str):
    model = YOLO(model_path)
    result = model.export(format="coreml", nms=True, imgsz=640)
    print(f"Exported: {result}")
    return result


def main():
    Path("Resources").mkdir(exist_ok=True)
    export("models/detector1_v0.7.13.pt")
    export("models/detector2_v0.7.13.pt")


if __name__ == "__main__":
    main()
