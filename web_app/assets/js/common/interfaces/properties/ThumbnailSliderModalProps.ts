export default interface ThumbnailSliderModalProps {
    onHide: Function,
    onSlideChange: Function,
    show: boolean,
    activeSliderIndex: number,
    thumbnails: Array<string>
}